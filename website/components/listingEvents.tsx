import React, { useState } from 'react';
import eventsList , {Event} from '@/models/eventsList';
import Image from 'next/image';
import PopUp from './ui/popUp';
import { BiDotsVerticalRounded } from 'react-icons/bi';
import { FiEdit3 } from 'react-icons/fi';
import { TbTrash } from 'react-icons/tb';
import { Button, Dialog, DialogActions, DialogContent } from '@mui/material';
import ContentField from './contentField';
import ImagePicker from './ui/imagePicker';

interface Props {
  onDelete: () => void;
  onEdit: () => void;
}

const EventActions: React.FC<Props> = ({ onDelete, onEdit }) => {
  return (
    <div className="grid grid-rows-2 bg-white w-fit gap-2 " style={{ zIndex: 999 }}>
      <button onClick={onEdit} className='flex'><FiEdit3 className='mt-1 mr-1' /> Edit</button>
      <button onClick={onDelete} className='flex'><TbTrash className='mt-1 mr-1' /> Delete</button>
    </div>
  );
};

const ListingEvents: React.FC = () => {
  const [showActions, setShowActions] = useState<boolean[]>(new Array(eventsList.length).fill(false));
  const [open, setOpen] = useState(false);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [selectedImagePath, setSelectedImagePath] = useState<string>('');

  const toggleActions = (index: number) => {
    setShowActions((prev) => prev.map((value, i) => (i === index ? !value : false)));
  };

  const deleteEvent = (index: number) => {
    // Implement delete functionality here
    console.log('Delete event at index', index);
  };

  const editEvent = (index: number) => {
    setSelectedIndex(index);
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedIndex(null);
  };

  return (
    <div className='flex flex-col pt-5 gap-2 z-0'>
      {eventsList.map((Event: Event, index: number) => (
        <div key={index} className='relative w-80 h-16 border border-gray-15 mt-1 rounded-md flex items-center shadow'>
          {Event.imgPath ? (
            <Image src={Event.imgPath} width={55} height={55} alt={`Event ${index + 1}`} className=' p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          ) : (
            <Image src='/defaultEvent.jpeg' width={55} height={55} alt={`Default Event Image`} className='p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          )}
          <div className='flex flex-col items-start justify-center pl-3'>
            <label>{Event.title}</label>
            <label className='regular-12'>{Event.date.toLocaleDateString()}</label>
          </div>
          <div className='absolute top-1 right-0 pr-1'>
            <BiDotsVerticalRounded onClick={() => toggleActions(index)} />
            {showActions[index] && (
              <div className='absolute top-1 border border-gray-300 shadow-2xl right-4 bg-white p-2 rounded-md shadow' style={{ zIndex: 999 }}>
                <EventActions onDelete={() => deleteEvent(index)} onEdit={() => editEvent(index)} />
              </div>
            )}
          </div>
        </div>
      ))}
      <div>
        <Dialog open={open} onClose={handleClose} aria-labelledby="alert-dialog-title" aria-describedby="alert-dialog-description"  className='flex w-full justify-center items-center '>
          <DialogContent className='w-full h-full  p-3 '>
            {selectedIndex != null && (
              <div className='flex flex-col w-full h-full rounded-md border border-dashed border-blue-600 p-3 gap-3'>
                <ImagePicker isContentPic={true} onImageSelected={setSelectedImagePath} disabled={false} contentPicPath={eventsList[selectedIndex].imgPath? eventsList[selectedIndex].imgPath : '/defaultEvent.jpeg'}/>
                <div className='flex flex-col justify-center items-start gap-2'>
                 <ContentField initialValue={eventsList[selectedIndex].title} label='Title:' isEvent={true}/>
                 <ContentField initialDate={eventsList[selectedIndex].date} label='Date:' isEvent={true} isDate={true}/>
                </div>
              </div>
            )}
          </DialogContent>
          <DialogActions className='flex flex-row justify-end pr-1'>
            <div className='flex flex-row gap-3'>
              <Button onClick={() => setOpen(false)} className='bg-slate-100 text-blue-600 border border-blue-600'>Cancel</Button>
              <Button className='bg-blue-700 text-white px-2 py-0.5 regular-12 mr-4'> Save changes </Button>
            </div>
          </DialogActions>
        </Dialog>
      </div>
      
    </div>
  );
};

export default ListingEvents;
