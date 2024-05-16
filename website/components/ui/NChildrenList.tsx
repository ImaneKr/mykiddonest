import { Button, Dialog, DialogActions, DialogContent, IconButton , TextField } from '@mui/material';
import { DataGrid, GridActionsCellItem, GridCellParams, GridColDef } from '@mui/x-data-grid';
import React, { useState, useRef } from 'react';
import { FiEdit3 } from 'react-icons/fi';
import Image from 'next/image';
import { RiDeleteBin6Line } from 'react-icons/ri';
import ImagePicker from './imagePicker';
import GuardianField from '../guardianField';
import SliderComponent from './slider';
import { HiOutlineClipboardList } from 'react-icons/hi';

interface Row {
  id: number; 
  profile: string;
  name: string;
  age: string;
  guardian:string;
  category:string ; 
  RegestratedDate:string;
}

// Define the props for EditUserActionItem
interface EditKidActionItemProps {
  row: Row;
  deleteKid: () => void;
  scrollToEvaluation: () => void;
}

// EditUserActionItem component
const EditKidActionItem: React.FC<EditKidActionItemProps> = ({ row, deleteKid, scrollToEvaluation }) => {
  const evaluationRef = useRef<HTMLHeadingElement>(null);
  
  const handleSwipeToEvaluation = () => {
    if (evaluationRef.current) {
      evaluationRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  };

  const colors: string[] = ['text-orange-400', 'text-blue-400', 'text-green-90'];
  const [open, setOpen] = React.useState(false);
  const subjectsAndPercentages: { subject: string; percentage: number }[] = [
    { subject: 'Math', percentage: 85 },
    { subject: 'Science', percentage: 90 },
    { subject: 'History', percentage: 75 },
    // Add more subjects and percentages as needed
  ];

  const handleEdit = () => {
    setOpen(true);
    // You can also pass 'row' to your dialog form here.
  };

  const handleClose = () => {
    setOpen(false);
  };
  const [selectedImagePath, setSelectedImagePath] = useState<string>('');

  const [profileInfo, setProfileInfo] = useState({ profilepic: row.profile, name: row.name, dateOfBirth: '', allergies: '', syndromes: '', hobbies: '', authorizedPicUpPersons: '' });
  const [isChangingAllowed, setIsChangingAllowed] = useState(false);
  const allowChanges = () => {
    setIsChangingAllowed(!isChangingAllowed);
  };

  return (
    <>
      <IconButton onClick={handleEdit}>
        <FiEdit3 />
      </IconButton>
      <Dialog
        open={open}
        onClose={() => setOpen(false)}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
        maxWidth='sm'
        fullWidth={true}
      >
        <DialogContent className=' flex flex-col  w-full '>
          <div className='flex flex-row justify-between w-full  items-center lg:pr-10 lg:pl-5'>
            <div className='flex h-30 w-30'><ImagePicker onImageSelected={setSelectedImagePath} disabled={!isChangingAllowed} isProfilePic={true} profilePic={row.profile} /></div>
            <div className='flex flex-row  justify-between lg:pr-20  items-center'> <p className='text-3xl font-semibold font-sans'>{profileInfo.name}</p>
            <div className='flex flex-row w-full justify-end pl-10'><Button className='flex w-8 h-8 pt-1 text-slate-600' onClick={allowChanges}><FiEdit3 className='w-full h-full ' /></Button>
              <Button onClick={handleSwipeToEvaluation} className='flex w-8 h-8 pt-1 text-slate-600'><HiOutlineClipboardList className='w-full h-full' /></Button></div>
            </div>
          </div>
          <hr className={`m-2.5`} />
          <div className='flex justify-between mb-3 px-8'>
            <GuardianField initialValue={profileInfo.name} label='Full name' disabled={!isChangingAllowed} />
          </div>
          <div className='flex justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={profileInfo.dateOfBirth} label='Date of birth' isDate={true} disabled={!isChangingAllowed} />
          </div>
          <div className='flex justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={profileInfo.allergies} label='Allergies ' disabled={!isChangingAllowed} />
          </div>
          <div className='flex justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={profileInfo.syndromes} label='Syndromes' disabled={!isChangingAllowed} />
          </div>
          <div className='flex justify-between gap-20  px-8'>
            <GuardianField initialValue={profileInfo.hobbies} label='Hobbies' isPassword={true} disabled={!isChangingAllowed} />
          </div>
          <div className='flex justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={profileInfo.authorizedPicUpPersons} label='Authorized pick-up persons' disabled={!isChangingAllowed} />
          </div>
          <hr className={`m-2.5`} />
          <h1 ref={evaluationRef} id='evaluation' className='pl-5 font-medium pt-4 pb-3'>Kid&apos;s evaluation</h1>
          <div className='flex flex-col w-full h-full pb-8 items-center justify-center pl-14 gap-3 mt-3'>
            {subjectsAndPercentages.map(({ subject, percentage }, index) => (
              <div key={index} className='flex flex-row w-full justify-between items-center'>
                <h3 className='flex w-1/3'>{subject}</h3>
                <div className='flex flex-row w-full justify-start items-center'>
                  <SliderComponent initialValue={percentage} color={colors[index % 3]} />
                  <h1 className={colors[index % 3]}>%</h1>
                </div>
              </div>
            ))}
          </div>
        </DialogContent>
        <DialogActions className='flex flex-row justify-between pl-7 pr-3' >
          <Button className='flex flex-row gap-2 justify-center items-center bg-red-10' onClick={() => {
            setOpen(false);
            deleteKid();
          }} >
            <RiDeleteBin6Line className='text-red-90 m-1' />
            <label className='text-red-90 text-sm'>Delete</label>
          </Button>
          <div className='flex flex-row gap-3'><Button onClick={() => setOpen(false)} className='bg-slate-100 text-blue-600 border border-blue-600'>Cancel</Button>
            <Button className='bg-blue-700 text-white px-2  regular-12 mr-7'> Save changes </Button></div>
        </DialogActions>
      </Dialog>
    </>
  );
};

const KidList = () => {
  const today = new Date();
  const formattedDate = today.toLocaleDateString('en-GB');
  const InitialRows: Row[] = [
    { id: 1, profile: '/person-3.png', name: 'Mariem', age: '5', guardian: 'Mohammed', category: 'A', RegestratedDate: '' }
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
    () => [
      {
        field: 'profile',
        headerName: '',
        headerClassName: ' hidden justify-center bold-20',
        width: 60,
        filterable: false,
        sortable: false,
        renderCell: (params: GridCellParams) => (
          <Image src={params.row.profile as string} alt="Profile" width={45} height={45} className='rounded-full' />
        ),
      },
      {
        field: 'name',
        headerName: 'Name',
        headerClassName: ' justify-center bold-20 ',
        flex: 1,
      },
      {
        field: 'age',
        headerName: 'Age',
        headerClassName: ' justify-center bold-20 ',
        flex: 1,
      },
      {
        field: 'guardian',
        headerName: 'Guardian',
        headerClassName: ' justify-center bold-20',
        flex: 1,
      },
      {
        field: 'category',
        headerName: 'Category',
        headerClassName: ' justify-center bold-20',
        flex: 1,
      },
      {
        field: 'RegestratedDtae',
        headerName: 'Regestrated Date',
        headerClassName: ' justify-center bold-20 ',
        flex: 1,
      },
      {
        field: 'Action',
        type: 'actions',
        headerClassName: '',
        getActions: (params: GridCellParams<Row>) => [
          <EditKidActionItem key={1} row={params.row} deleteKid={deleteUser(Number(params.id))} scrollToEvaluation={function (): void {
            throw new Error('Function not implemented.');
          } } />,
        ]
      }
    ],
    [deleteUser],
  );

  return (
    <div className='w-[98%] '>
      <DataGrid rows={rows} columns={columns} />
    </div>
  );
};

export default KidList;
