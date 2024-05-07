import { Button, Dialog, DialogActions, DialogContent, IconButton, TextField } from '@mui/material';
import { DataGrid, GridActionsCellItem, GridCellParams, GridColDef } from '@mui/x-data-grid';
import React, { useState } from 'react';
import { FiEdit3 } from 'react-icons/fi';
import Image from 'next/image';
import { RiDeleteBin6Line } from 'react-icons/ri';
import ImagePicker from './imagePicker';
import { profile } from 'console';
import GuardianField from '../guardianField';

interface Row {
  id: number;
  profile: string;
  name: string;
  phone: string;
  kids: string;
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
  const [selectedImagePath, setSelectedImagePath] = useState<string>('');

  const [accountInfo, setAccountInfo] = useState({ profilepic: row.profile, name: row.name, dateOfBirth: '', phone: row.phone, password: '', email: '' });
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
        <DialogContent className=' flex flex-col  '>
          <div className='flex flex-row justify-between items-center lg:pr-10 lg:pl-5'>
            <div className='flex h-30 w-30'> <ImagePicker onImageSelected={setSelectedImagePath} disabled={!isChangingAllowed} isProfilePic={true} profilePic={row.profile} /></div>
            <div className='flex flex-row justify-start lg:gap-10 gap-4 lg:pr-28 items-center'> <p className='text-3xl font-semibold font-sans'>{accountInfo.name}</p>
              <Button className='flex w-8 h-8 pt-1 text-slate-600' onClick={allowChanges}><FiEdit3 className='w-full h-full ' /></Button>   </div>
          </div>
          <hr className={`m-2.5`} />
          <div className='flex justify-between mb-3 px-8'>

            <GuardianField initialValue={accountInfo.name} label='Full name' disabled={!isChangingAllowed} />
          </div>
          <div className='flex   justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={accountInfo.dateOfBirth} label='Date of birth' isDate={true} disabled={!isChangingAllowed} />
          </div>
          <div className='flex   justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={accountInfo.phone} label='Phone number ' disabled={!isChangingAllowed} />
          </div>
          <div className='flex   justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={accountInfo.email} label='Email address' disabled={!isChangingAllowed} />
          </div>
          <div className='flex   justify-between gap-20 mb-3 px-8'>
            <GuardianField initialValue={accountInfo.password} label='Password' isPassword={true} disabled={!isChangingAllowed} />
          </div>

        </DialogContent>
        <DialogActions className='flex flex-row justify-between pl-7 pr-3' >
          <Button className='flex flex-row gap-2 justify-center items-center bg-red-10' onClick={() => {
            setOpen(false);
            deleteUser();
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

const GuardianList = () => {
  const today = new Date();
  const formattedDate = today.toLocaleDateString('en-GB');
  const InitialRows: Row[] = [
    { id: 1, profile: '/person-3.png', name: 'Mariem', phone: '34', kids: 'Ahmed , Sarah', rdate: formattedDate }
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
        field: 'phone',
        headerName: 'Phone',

        headerClassName: ' justify-center bold-20 ',
        flex: 1,
      },
      {
        field: 'kids',
        headerName: 'Kids',
        headerClassName: ' justify-center bold-20',

        flex: 1,
      },
      {
        field: 'rdate',
        headerName: 'Regestrated Date',
        headerClassName: ' justify-center bold-20 ',

        flex: 1,
      },
      {
        field: 'Action',
        type: 'actions',
        headerClassName: '',
        getActions: (params: GridCellParams<Row>) => [
          <EditUserActionItem key={1} row={params.row} deleteUser={deleteUser(Number(params.id))} />,
        ]
      }
    ],
    [deleteUser],
  )

  return (
    <div className='w-[98%] '>
      <DataGrid rows={rows} columns={columns} />
    </div>
  );
};

export default GuardianList