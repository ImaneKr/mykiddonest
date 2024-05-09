import { Button, Dialog, DialogActions, DialogContent, FormControlLabel, Radio, RadioGroup, TextField, colors } from '@mui/material';
import { useState } from 'react'
import ImagePicker from './imagePicker';
import React from 'react';

interface FormDialogProps {
    open: boolean;
    setOpen: (value: boolean) => void;
}
const CreateStaffAccount : React.FC<FormDialogProps> =  ({ open, setOpen }) => {
   
    const [formValues, setFormValues] = useState({ name: '', email: '',phone:'', username:'', profileImage:'',password:''});
    const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
      setFormValues({ ...formValues, [e.target.name]: e.target.value });
    };
   const handleClose = () => {
        setOpen(false);
    };
    const handleSubmit = (e: React.FormEvent) => {
      e.preventDefault();
      console.log(formValues);
      setOpen(false);
    };

   const [selectedImagePath,setSelectedImagePath] =useState<string>('');
    
  return (
    <React.Fragment>
       <button className='inline-block px-2 py-1 text-white bg-blue-90 rounded-md '
            onClick={() => setOpen(true)}
            >
            + New Profile   
      </button>
      <Dialog
        open={open}
        onClose={() => setOpen(false)}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"

        maxWidth='sm'
        fullWidth={true}
      >
        <DialogContent className=' flex flex-col mb-8'>
         <div className=''>
           <ImagePicker onImageSelected={setSelectedImagePath} disabled={false} isProfilePic={true} profilePic=''/>
         </div>
          <hr className='m-2.5' />
          <div className='flex justify-between lg:flex-row flex-col mb-3 px-8'>
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
         <div className='flex justify-between lg:flex-row flex-col mb-3 px-8'>
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

          <div className='flex   justify-between lg:flex-row flex-col mb-3 px-8'>
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
           //value={accountInfo.allergies}
           />
          </div>
          <div className='flex   justify-between lg:flex-row flex-col mb-3 px-8'>
            <p className='lg:regular-18 regular-16'>
            Email Address
           </p>
          <TextField 
           type='email'
           name='email'
           helperText
           autoFocus
           size='small'
            className=' lg:w-56 w-[99%]'
           //={accountInfo.syndromes}
           />
          </div>
          <div className='flex   justify-between lg:flex-row flex-col mb-3 px-8'>
            <p className='lg:regular-18 regular-16'>
            Phone Number
           </p>
          <TextField 
           type='text'
           name='phoneNumber'
           helperText
           autoFocus
           size='small'
            className=' lg:w-56 w-[99%]'
           //={accountInfo.syndromes}
           />
          </div>
          <div className='flex   justify-between lg:flex-row flex-col mb-3 px-8'>
            <p className='lg:regular-18 regular-16'>
            Password
           </p>
          <TextField 
           type='password'
           name='password'
           autoFocus
           size='small'
            className=' lg:w-56 w-[99%]'
           //value={accountInfo.hobbies}
           />
          </div>
          
        </DialogContent>
        <DialogActions className='pr-10'>
          <Button onClick={() => setOpen(false)}>Cancel</Button>
          <Button  type='submit' className='bg-blue-600 text-white inline-block px-2 rounded-lg'> Submit </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  )
}

export default CreateStaffAccount
