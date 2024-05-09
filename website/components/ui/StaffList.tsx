import { Button, Dialog, DialogActions, DialogContent, FormControlLabel, Radio, RadioGroup, TextField, colors } from '@mui/material';
import { DataGrid, GridActionsCellItem, GridCellParams, GridColDef } from '@mui/x-data-grid';
import React, { useState } from 'react';
import { FiEdit3 } from 'react-icons/fi';
import Image from 'next/image';
import { RiDeleteBin6Line } from 'react-icons/ri';
import ImagePicker from './imagePicker';
import { profile } from 'console';
import StaffField from '../staffField';

// Define the type for row
interface Row {
  id: number;
  profile: string;
  name: string;
  phone: string;
  role: 'Sacretary'|'Teacher'; 
  rdate: string;

}

// Define the props for EditUserActionItem
interface EditUserActionItemProps {
  row: Row;
  deleteUser: () => void;
}

// EditUserActionItem component
const EditUserActionItem: React.FC<EditUserActionItemProps> = ({ row, deleteUser }) => {
  const [open, setOpen] = React.useState(false);

  const handleEdit = () => {
    setOpen(true);
    // You can also pass 'row' to your dialog form here.
  };

  const handleClose = () => {
    setOpen(false);
  };
const [selectedImagePath,setSelectedImagePath] =useState<string>('');

  const [accountInfo, setAccountInfo] = useState({ profilepic:row.profile ,name: row.name, phone:row.phone, password:'', email:''});

  return (
    <>
      <Button onClick={handleEdit}>
        <FiEdit3 />
      </Button>
      <Dialog
        open={open}
        onClose={() => setOpen(false)}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
        maxWidth='sm'
        fullWidth={true}
      >
        <DialogContent className=' flex flex-col mb-8'>
          <div className='flex flex-row justify-between items-center lg:pr-10 lg:pl-5 pr-3'>
         <div className='flex h-30 w-30'> <ImagePicker   onImageSelected={setSelectedImagePath} disabled={false} isProfilePic={true} profilePic={accountInfo.profilepic} /></div>
             <div className='flex flex-row justify-start lg:gap-10 gap-4 lg:pr-28 items-center'> <p className='text-3xl font-semibold font-sans'>{accountInfo.name}</p>
        </div>         
          </div>
          <hr className='m-2.5' />
         <div className='flex justify-between lg:flex-row flex-col  mb-5 px-8  '>
          <p className='lg:regular-18 regular-16'>
            First Name
           </p>
          <TextField 
           type='text'
           name='first name'
           placeholder='First Name'
           autoFocus
           size='small'
           //value={accountInfo.name}
           className=' lg:w-56 w-[99%]'
           />
          </div>
         <div className='flex justify-between lg:flex-row flex-col mb-5 px-8'>
          <p className='lg:regular-18 regular-16'>
            Last Name
           </p>
          <TextField 
           type='text'
           name='last name'
           placeholder='Last Name'
           autoFocus
           size='small'
           //value={accountInfo.name}
           className=' lg:w-56 w-[99%]'
           />
          </div>
          
            <div className='flex justify-between  lg:flex-row flex-col mb-3 px-8'>
            <p className='lg:regular-18 regular-16'>
            Role
         </p>
           <RadioGroup
           aria-labelledby="demo-radio-buttons-group-label"
           defaultValue="Teacher"
           name="radio-buttons-group"
           className=' flex flex-row justify-between'
          >
            <FormControlLabel value="Secretry" control={<Radio />} label="Sacretary" />
            <FormControlLabel value="Teacher" control={<Radio />} label="Teacher" />
         </RadioGroup>
          
          </div>
        
          <div className='flex lg:flex-row flex-col  justify-between lg:gap-20 mb-5 px-8'>
          <p className='lg:regular-18 regular-16'>
            Username
           </p>
          <TextField 
           type='text'
           name='username'
           placeholder='username'
           autoFocus
           size='small'
           className=' lg:w-56 w-[99%]'

           />
          </div>
          <div className='flex  lg:flex-row flex-col justify-between lg:gap-20 mb-5 px-8'>
          <p className='lg:regular-18 regular-16'>
            Email Address
           </p>
          <TextField 
           type='email'
           name='email' 
           placeholder='email'
           autoFocus
           size='small'
           className=' lg:w-56 w-[99%]'

           />
          </div>
          <div className='flex  lg:flex-row flex-col justify-between lg:gap-20 mb-5 px-8'>
          <p className='lg:regular-18 regular-16'>
            Phone Number
           </p>
          <TextField 
           type='text '
           name='phoneNumber' 
           placeholder='Phone Number'
           autoFocus
           size='small'
           className=' lg:w-56 w-[99%]'

           />
          </div>
          <div className='flex lg:flex-row flex-col  justify-between lg:gap-20 mb-5  px-8'>
          <p className='lg:regular-18 regular-16'>
            Password
           </p>
          <TextField 
           type='password'
           name='password'
           placeholder='password'
           autoFocus
           size='small'
           className=' lg:w-56 w-[99%]'

           //value={accountInfo.hobbies}
           />
          </div>    
        </DialogContent>
        <DialogActions className='flex flex-row justify-between pl-7 pr-3' >
          <Button  className='flex flex-row gap-2 justify-center items-center bg-red-10' onClick={() => {
              setOpen(false);
              deleteUser();
            }} >
              <RiDeleteBin6Line className='text-red-90 m-1'/>
              <label className='text-red-90 text-sm'>Delete</label>
            </Button>
          <div className='flex flex-row gap-3'><Button onClick={() => setOpen(false)} className='bg-slate-100 text-blue-600 border border-blue-600'>Cancel</Button>
          <Button className='bg-blue-700 text-white px-2  regular-12 mr-7'> Save changes </Button></div>
        </DialogActions>
      </Dialog>
    </>
  );
};

const StaffList = () => {
  const today = new Date();
  const formattedDate = today.toLocaleDateString('en-GB');
  const InitialRows: Row[] = [
    {
        id: 1, profile: '/person-3.png', name: 'Mariem', phone: '34', role: 'Sacretary', rdate: formattedDate,
    },
     {
        id: 2, profile: '', name: 'Khadidja', phone: '079873543', role: 'Teacher', rdate: formattedDate,
    }
  ];

  const [rows, setRows] = React.useState<Row[]>(InitialRows);

  const deleteUser = React.useCallback(
    (id: number) => () => {
      setTimeout(() => {
        setRows(prevRows => prevRows.filter(row => row.id !== id));
      });
    },
    [],
  );

  const columns = React.useMemo<GridColDef<Row>[]>(
        () =>[
    {
      field:'profile',
      headerName:'',
      headerClassName:' hidden justify-center bold-20',
      width: 60,
      filterable:false,
      sortable:false,
      renderCell:(params: GridCellParams) => (
        <Image src={params.row.profile as string} alt="Profile" width={45} height={45} className='rounded-full' />
      ),
    },
    {
        field:'name',
        headerName:'Name' ,
        headerClassName:' justify-center bold-20 ',
        width:160,
    },
    {
        field:'phone',
        headerName:'Phone',
        
        headerClassName:' justify-center bold-20 ',
        width:160,
    },
    {
        field:'role',
        type:'singleSelect',
        valueOptions:['Sacretary','Teacher'],
        headerName:'Role',
        headerClassName:' justify-center bold-20',
        width:180
    },
    {
        field:'rdate',
        headerName:'Regestrated Date',
        headerClassName:' justify-center bold-20 ',
        
        width:190
    },
    {
      field:'Action',
      type:'actions',
      headerClassName:'',
     getActions: (params: GridCellParams<Row>) => [
      <EditUserActionItem key={1} row={params.row} deleteUser={deleteUser(Number(params.id))} />,
    ]
    }
],
 [deleteUser],
)

  return (
    <div className='w-[98%]'>
      <DataGrid rows={rows} columns={columns} />
    </div>
  );
};

export default StaffList