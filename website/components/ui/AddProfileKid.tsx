import { Button, Dialog, DialogActions, DialogContent, FormControlLabel, Radio, RadioGroup, TextField, colors } from '@mui/material';
import { useState } from 'react'
import ImagePicker from './imagePicker';
import React from 'react';

interface FormDialogProps {
    open: boolean;
    setOpen: (value: boolean) => void;
}
const AddProfileKid : React.FC<FormDialogProps> =  ({ open, setOpen }) => {
   
    const [formValues, setFormValues] = useState({ name: '', email: '',phone:'+213', username:'', profileImage:'',password:'sd'});
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
           <ImagePicker onImageSelected={setSelectedImagePath} disabled={false} isProfilePic={true}/>
         </div>
          <hr className='m-2.5 mb-5' />
          <div className='flex justify-between lg:flex-row flex-col  mb-5 px-8 '>
          <p className='regular-18'>
            First Name
           </p>
          <TextField 
           type='text'
           name='first name'
           placeholder='First Name'
           size='small'
           //value={accountInfo.name}
           className='border-2'
           />
          </div>
          <div className='flex justify-between  items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='regular-18'>
            Last Name
           </p>
          <TextField 
           type='text'
           name='last name'
           placeholder='Last Name'
           size='small'
           //value={accountInfo.name}
            className=' lg:w-56 w-[99%]'
           />
          </div>
          
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='  regular-18 '>
            Date Of birth
           </p>
          <TextField 
           type='date'
           name=' date of birth'
           size='small'
            className=' lg:w-56 w-[99%]'
           //value={accountInfo.date}
           />
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='regular-18'>
            Relationship to child
           </p>
          <TextField 
           type='text'
           name='relation'
           placeholder='Relationship ..'
           size='small'
           //value={accountInfo.name}
            className=' lg:w-56 w-[99%]'
           />
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='regular-18'>
            Gender
           </p>
           <RadioGroup
    aria-labelledby="demo-radio-buttons-group-label"
    defaultValue="female"
    name="radio-buttons-group"
   className=' flex flex-row justify-between items-center '
          >
    <FormControlLabel value="female" control={<Radio />} label="Female" />
    <FormControlLabel value="male" control={<Radio />} label="Male" />
    
  </RadioGroup>
          
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='  regular-18 '>
            Allergies
           </p>
          <TextField 
           type='text'
           name='allergies'
           placeholder='Allergies'
           multiline
           size='small'
            className=' lg:w-56 w-[99%]'
           //value={accountInfo.allergies}
           />
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='  regular-18 '>
            Syndromes
           </p>
          <TextField 
           type='text'
           name='syndromes'
           placeholder='Syndromes'
          multiline
           size='small'
            className=' lg:w-56 w-[99%]'
           //={accountInfo.syndromes}
           />
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='  regular-18 '>
            Hobbies
           </p>
          <TextField 
           type='text'
           name='hobbies'
           placeholder='Hobbies'
           multiline
            className=' lg:w-56 w-[99%]'
           size='small'
           //value={accountInfo.hobbies}
           />
          </div>
          <div className='flex justify-between items-center lg:flex-row flex-col  mb-5 px-8 '>
          <p className='  regular-18 '>
            Authorized pick-up persons
           </p>
          <TextField 
           type='text'
           name='authorized persons'
           placeholder='mention'
           multiline
            className=' lg:w-56 w-[99%]'
           size='small'
           //value={accountInfo.authorizedPerson}
           />
          </div>
        </DialogContent>
        <DialogActions className='pr-7'>
          <Button onClick={() => setOpen(false)}>Cancel</Button>
          <Button  type='submit' className='bg-blue-600 text-white inline-block px-2  rounded-lg'> Submit </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  )
}

export default AddProfileKid
