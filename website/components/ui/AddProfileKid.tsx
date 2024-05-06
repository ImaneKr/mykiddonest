import { Button, Dialog, DialogActions, DialogContent, FormControlLabel, Radio, RadioGroup, TextField, colors } from '@mui/material';
import { useState } from 'react'
import ImagePicker from './imagePicker';
import React from 'react';
import Axios from 'axios';
import { profile } from 'console';

interface FormDialogProps {
  open: boolean;
  setOpen: (value: boolean) => void;
}
const AddProfileKid: React.FC<FormDialogProps> = ({ open, setOpen }) => {

  const [formValues, setFormValues] = useState({ 
  firstname: '', 
  lastname: '', 
  profilepic: '', 
  dateOFbirth: '', 
  gender: '',
  allergies: '',
  hobbies:'',
  syndromes:'',
  relationtothechild:'',
  authorizedpuckups:''
});
  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormValues({ ...formValues, [e.target.name]: e.target.value });
  };
  const handleClose = () => {
    setOpen(false);
  };
  const handleSubmit = async(e: React.FormEvent) => {
    e.preventDefault();
   try{
    await Axios.post('/api/kid', formValues);
    await Axios.put('./api/kid')
    console.log('Profile created successfully');
    setOpen(false);
   }catch{
    console.error('Error creating profile:', Error);

   }
  };

  const [selectedImagePath, setSelectedImagePath] = useState<string>('');

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
            <ImagePicker onImageSelected={setSelectedImagePath} disabled={false} isProfilePic={true} />
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
              value={formValues.firstname}
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
              value={formValues.lastname}
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
              value={formValues.dateOFbirth}
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
              value={formValues.relationtothechild}
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
              value={formValues.gender}
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
              value={formValues.allergies}
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
             value={formValues.syndromes}
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
              value={formValues.hobbies}
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
              value={formValues.authorizedpuckups}
            />
          </div>
        </DialogContent>
        <DialogActions className='pr-7'>
          <Button onClick={handleClose}>Cancel</Button>
          <Button type='submit' 
          className='bg-blue-600 text-white inline-block px-2  rounded-lg'
          onClick={handleSubmit}
          > 
          Submit
         </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  )
}

export default AddProfileKid
