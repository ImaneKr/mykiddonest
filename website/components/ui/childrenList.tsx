import React, { useState } from 'react'
import { DataGrid, GridActionsCellItem, GridActionsCellItemProps, GridCellParams, GridColDef, GridRowId, GridValueGetter } from '@mui/x-data-grid';
import { Box, Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, Divider, Input, TextField } from '@mui/material';
import { FiEdit3 } from 'react-icons/fi';
import {TbTrash} from 'react-icons/tb'
import ImagePicker from './imagePicker';
import Image from 'next/image';
import ChildrenField from '../childrenField';
import Axios from 'axios';


const ChildrenList = () => {

    const InitialRows =[
    {id:1,profile:'/person-3.png' ,name:'Arij',age:'5' }
    ];
    type Row = (typeof InitialRows)[number];

      const [rows, setRows] = React.useState<Row[]>(InitialRows);
    
      const deleteUser = React.useCallback(
        (id: GridRowId) => () => {
          setTimeout(() => {
            setRows((prevRows:any) => prevRows.filter((row:any) => row.id !== id));
          });
        },
        [],
      );
      const columns = React.useMemo<GridColDef<Row>[]>(
        () =>[
    {
      field:'profile pic',
      headerName:'',
      headerClassName:' justify-center bold-20',
      renderCell:(params: GridCellParams) => (
        <Image src={params.row.profile as string} alt="Profile" width={45} height={45} className='rounded-full' />
      ),
    },
    {
        field:'name',headerName:'Name' ,headerClassName:' justify-center bold-20 ',width:175,
    },
    {
        field:'age',headerName:'Age',headerClassName:' justify-center bold-20 ',width:146,
    },
    {
        field:'guardian',headerName:'Guardian',headerClassName:' justify-center bold-20',width:180
    },
    {
      field:'category',
      headerName:'Category',
      type: 'singleSelect',
      valueOptions:['Basic','Advanced'],
      headerClassName:' justify-center bold-20',
      width:180
    },
    {
        field:'rdate',headerName:'Regestrated Date',headerClassName:' justify-center bold-20 ',width:195
    },
    {
      field:'Action',
      type:'actions',
      headerClassName:'',
      maxWidth:50,
      getActions:( params:any) =>[
        <DeleteUserActionItem
            key={1}
            label="Edit"
            showInMenu
            icon={<FiEdit3 />}
            deleteUser={deleteUser(params.id)}
            closeMenuOnClick={false}
          />,
      ]
    }
],
 [deleteUser],
)

  return (
    <div className='w-[98%]'>
    <DataGrid rows={rows} columns={columns} />
  </div>
  )
}

function DeleteUserActionItem({
  deleteUser,
  ...props
}: GridActionsCellItemProps & { deleteUser: () => void }) {
  const [open, setOpen] = React.useState(false);
  const [selectedImagePath,setSelectedImagePath] =useState<string>('');
  const [accountInfo, setAccountInfo] = useState({ name: '', date:'', allergies:'', syndromes:'', hobbies:'', authorizedPerson:'' , image:'/person-3.png'});
  const saveChanges = async () => {
    try {
      // Prepare the data to be sent to the backend
      const data = {
       // Assuming you have the kid's ID
        firstname: accountInfo.name.split(' ')[0], // Extract first name from full name
        lastname: accountInfo.name.split(' ')[1], // Extract last name from full name
        dateOfbirth: accountInfo.date,
        allergies: accountInfo.allergies.split(','),
        hobbies: accountInfo.hobbies,
        authorizedpickups: accountInfo.authorizedPerson,
        syndromes: accountInfo.syndromes,
      };

      // Send a POST request to your backend API endpoint
      const response = await Axios.post('/api/editKidProfile', data);
      
      // Handle success
      console.log('Edit successful:', response.data);
      // Optionally, you can close the dialog or perform other actions upon successful edit
      setOpen(false);
    } catch (error) {
      // Handle error
      console.error('Error editing KidProfile:', error);
      // Optionally, you can display an error message to the user
    }
  };
  

  return (
    <React.Fragment>
      <GridActionsCellItem {...props} onClick={() => setOpen(true)} />
      <Dialog
        open={open}
        onClose={() => setOpen(false)}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
        maxWidth='sm'
        fullWidth={true}
      >
        <DialogContent className=' flex flex-col mb-8'>
<div className='flex flex-row justify-between items-center lg:pr-10 lg:pl-5'>
         <div className='flex h-30 w-30'> <ImagePicker   onImageSelected={setSelectedImagePath} disabled={false} isProfilePic={true} profilePic={accountInfo.image} /></div>
             <div className='flex flex-row justify-start lg:gap-10 gap-4 lg:pr-28 items-center'> <p className='text-3xl font-semibold font-sans'>{accountInfo.name}</p>
        </div>         
          </div>
          <hr className='m-2.5' />
         <div className='flex lg:flex-row flex-col justify-between mb-3 px-8'>
          <ChildrenField label='Full name' initialValue={accountInfo.name}/>
          </div>
          <div className='flex  lg:flex-row flex-col justify-between  mb-3 px-8'>
          <ChildrenField label='Date of birth' initialValue={accountInfo.date} isDate={true}/>
          </div>
          <div className='flex  lg:flex-row flex-col justify-between mb-3 px-8'>
          <ChildrenField initialValue={accountInfo.allergies} label='Allergies'/>
          </div>
          <div className='flex lg:flex-row flex-col  justify-between mb-3 px-8'>
          <ChildrenField label='Syndromes' initialValue={accountInfo.syndromes}/>
          </div>
          <div className='flex lg:flex-row flex-col  justify-between mb-3 px-8'>
          <ChildrenField label='Hobbies' initialValue={accountInfo.hobbies}/>
          </div>
          <div className='flex lg:flex-row flex-col  justify-between mb-3 px-8'>
          <ChildrenField label='Authorized pick-up persons' initialValue={accountInfo.authorizedPerson}/>
          </div>
        </DialogContent>
        <DialogActions className='pr-10'>
        <Button
            onClick={() => {
              setOpen(false);
              deleteUser();
            }}
            color="warning"
            autoFocus
            className=' rounded-lg'
          > 
            <TbTrash className='text-orange-600 size-[1rem] mr-1 '/>
           
            Delete
          </Button>
          <Button onClick={() => setOpen(false)}>Cancel</Button>
          <Button className='bg-blue-600 text-white inline-block px-2 rounded-lg'> Save Changes </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  );
}


export default ChildrenList


