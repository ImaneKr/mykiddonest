import { Button, Dialog, DialogActions, DialogContent, FormControlLabel, Radio, RadioGroup, TextField, colors } from '@mui/material';
import { useState } from 'react'
import ImagePicker from './imagePicker';
import React from 'react';

interface FormDialogProps {
    open: boolean;
    setOpen: (value: boolean) => void;
}
const CreateGuardianAccount : React.FC<FormDialogProps> =  ({ open, setOpen }) => {
   
    const [formValues, setFormValues] = useState({ name: '', email: '',phone:'+213', username:'', profileImage:'',password:''});
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
        <DialogContent className=' flex flex-col '>
         <div className='pb-2'>
           <ImagePicker onImageSelected={setSelectedImagePath} disabled={false} isGuardianPic={true} />
         </div>
          <hr className='pb-7' />
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
          <div className='flex justify-between items-center lg:flex-row flex-col mb-5 px-8'>
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
            
            <div className='flex lg:flex-row flex-col  justify-between items-center lg:gap-20 mb-5 px-8'>
            <p className='lg:regular-18 regular-16'>
              Date Of birth
            </p>
            <TextField 
            type='date'
            name=' date of birth'
            autoFocus
            size='small'
            className=' lg:w-56 w-[99%]'

            //value={accountInfo.date}
            />
            </div>
            <div className='flex lg:flex-row flex-col justify-between items-center lg:gap-20 mb-5 px-8'>
            <p className='lg:regular-18 regular-16'>
              Relationship to child
            </p>
            <TextField 
            type='text'
            name='relation'
            placeholder='Relationship ..'
            autoFocus
            size='small'
            //value={accountInfo.name}
            className='border-2'
            />
            </div>
          <div className='flex justify-between items-center mb-3 px-8'>
            <p className='lg:regular-18 regular-16 pr-4'>
              Gender:
            </p>
            <RadioGroup
      aria-labelledby="demo-radio-buttons-group-label"
      defaultValue="female"
      name="radio-buttons-group"
    className=' flex flex-row '
            >
      <FormControlLabel value="female" control={<Radio />} label="Female" />
      <FormControlLabel value="male" control={<Radio />} label="Male" />
      
    </RadioGroup>
            
            </div>
            <div className='flex lg:flex-row flex-col  justify-between items-center lg:gap-20 mb-5 px-8'>
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
            <div className='flex  lg:flex-row flex-col justify-between items-center lg:gap-20 mb-5 px-8'>
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
            <div className='flex  lg:flex-row flex-col justify-between items-center lg:gap-20 mb-5 px-8'>
            <p className='lg:regular-18 regular-16'>
              Phone Number
            </p>
            <TextField 
            type='text'
            name='phoneNumber' 
            placeholder='phone number'
            autoFocus
            size='small'
            className=' lg:w-56 w-[99%]'

            />
            </div>
            <div className='flex  lg:flex-row flex-col justify-between items-center lg:gap-20 mb-5 px-8'>
            <p className='lg:regular-18 regular-16'>
              Civil state
            </p>
            <TextField 
            type='text'
            name='civilState' 
            placeholder='civil state '
            autoFocus
            size='small'
            className=' lg:w-56 w-[99%]'

            />
            </div>
            <div className='flex  lg:flex-row flex-col justify-between items-center lg:gap-20 mb-5 px-8'>
            <p className='lg:regular-18 regular-16'>
              Address
            </p>
            <TextField 
            type='text'
            name='address' 
            placeholder='address'
            autoFocus
            size='small'
            className=' lg:w-56 w-[99%]'

            />
            </div>
            
            <div className='flex lg:flex-row flex-col  justify-between items-center lg:gap-20 mb-5  px-8'>
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
        <DialogActions>
          <Button className='bg-slate-100 text-blue-600 border border-blue-600' onClick={() => setOpen(false)}>Cancel</Button>
          <Button  type='submit' className='bg-blue-600 text-white inline-block px-2 rounded-lg mr-10  '> Submit </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  )
}

export default CreateGuardianAccount
