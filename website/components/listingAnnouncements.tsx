import React, { useState } from 'react';
import announcementsList, { Announcement } from '@/models/announcementsList'; // Assuming you have a type/interface for Announcement
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

const AnnouncementActions: React.FC<Props> = ({ onDelete, onEdit }) => {
  return (
    <div className="grid grid-rows-2 bg-white w-fit gap-2">
      <button onClick={onEdit} className='flex'><FiEdit3 className='mt-1 mr-1' /> Edit</button>
      <button onClick={onDelete} className='flex'><TbTrash className='mt-1 mr-1' /> Delete</button>
    </div>
  );
};

const ListingAnnouncements: React.FC = () => {
  const [showActions, setShowActions] = useState<boolean[]>(new Array(announcementsList.length).fill(false));
  const [open, setOpen] = useState(false);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [selectedImagePath, setSelectedImagePath] = useState<string>(''); // State to hold selected image path

  const toggleActions = (index: number) => {
    setShowActions((prev) => prev.map((value, i) => (i === index ? !value : false)));
  };

  const deleteAnnouncement = (index: number) => {
    // Implement delete functionality here
    console.log('Delete announcement at index', index);
  };

  const editAnnouncement = (index: number) => {
    setSelectedIndex(index);
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedIndex(null);
  };
  return (
    <div className='flex flex-col pt-5 gap-2'>
      {announcementsList.map((announcement: Announcement, index: number) => (
        <div key={index} className='relative w-[95%] h-24 border py-1 border-gray-15 mt-1 pr-1 rounded-md flex items-center shadow'>
          {announcement.imgPath ? (
            <Image src={announcement.imgPath} width={80} height={80} alt={`Event ${index + 1}`} className='p-0.5 h-full m-1 rounded-md border border-gray-15 shadow' />
          ) : (
            <Image src='/defaultAnnouncement.jpg' width={80} height={80} alt={`Default Event Image`} className='p-0.5 h-full m-1 rounded-md border border-gray-15 shadow' />
          )}
          <div className='flex flex-col items-start justify-center pl-3'>
            <label>{announcement.title}</label>
            <label className='regular-12'>{announcement.description}</label>
          </div>
          <div className='absolute top-1 right-0 pr-1'>
            <BiDotsVerticalRounded onClick={() => toggleActions(index)} />
            {showActions[index] && (
              <div className='absolute top-4 border border-gray-300 shadow-2xl right-2 bg-white p-2 rounded-md shadow' style={{ zIndex: 999 }}>
                <AnnouncementActions onDelete={() => deleteAnnouncement(index)} onEdit={() => editAnnouncement(index)} />
              </div>
            )}
          </div>
        </div>
      ))}
      <div>
        <Dialog open={open} onClose={handleClose} aria-labelledby="alert-dialog-title" aria-describedby="alert-dialog-description"  className='flex w-full justify-center items-center ' >
          <DialogContent className='w-full h-full  p-3 '>
            {selectedIndex != null && (
              <div className='flex flex-col w-full h-full rounded-md border border-dashed border-blue-600 p-3 gap-3'>
                <ImagePicker isContentPic={true} onImageSelected={setSelectedImagePath} disabled={false} contentPicPath={announcementsList[selectedIndex].imgPath? announcementsList[selectedIndex].imgPath : '/defaultAnnouncement.jpg'}/>
                <div className='flex flex-col justify-center items-start gap-2'>
                 <ContentField initialValue={announcementsList[selectedIndex].title} label='Title:' />
                 <ContentField initialValue={announcementsList[selectedIndex].description} label='Description:' />
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
      <div className='absolute  flex bottom-40 right-0 z-50'>
        <PopUp trigger={false}>
          <p>You can put any content you want in here.</p>
        </PopUp>
      </div>
    </div>
  );
};

export default ListingAnnouncements;
