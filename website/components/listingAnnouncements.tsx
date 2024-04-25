import React, { useState } from 'react';
import announcementsList, { Announcement } from '@/models/announcementsList'; // Assuming you have a type/interface for Announcement
import Image from 'next/image';
import PopUp from './ui/popUp';
import { BiDotsVerticalRounded } from 'react-icons/bi';
import { FiEdit3 } from 'react-icons/fi';
import { TbTrash } from 'react-icons/tb';
import { Button, Dialog, DialogActions, DialogContent } from '@mui/material';

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
        <div key={index} className='relative w-[95%] h-24 border border-gray-15 mt-1 pr-1 rounded-md flex items-center shadow'>
          {announcement.imgPath ? (
            <Image src={announcement.imgPath} width={80} height={80} alt={`Event ${index + 1}`} className='p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          ) : (
            <Image src='/defaultAnnouncement.jpg' width={80} height={80} alt={`Default Event Image`} className='p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          )}
          <div className='flex flex-col items-start justify-center pl-3'>
            <label>{announcement.title}</label>
            <label className='regular-12'>{announcement.description}</label>
          </div>
          <div className='absolute top-1 right-0 pr-1'>
            <BiDotsVerticalRounded onClick={() => toggleActions(index)} />
            {showActions[index] && (
              <div className='absolute top-4 right-2 bg-white p-2 rounded-md shadow'>
                <AnnouncementActions onDelete={() => deleteAnnouncement(index)} onEdit={() => editAnnouncement(index)} />
              </div>
            )}
          </div>
        </div>
      ))}
      <div>
        <Dialog open={open} onClose={handleClose} aria-labelledby="alert-dialog-title" aria-describedby="alert-dialog-description" maxWidth='sm' fullWidth={true}>
          <DialogContent className=' flex flex-col mb-8'>
              <div className='flex flex-col items-start justify-center pl-3'>
            <label></label>
            <label className='regular-12'>
            </label>
          </div>
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose}>Cancel</Button>
            <Button className='bg-black text-white inline-block px-2 rounded-lg'> Save Changes </Button>
          </DialogActions>
        </Dialog>
      </div>
      <div className='absolute  flex bottom-40 right-0 z-50'><PopUp trigger={false}>
        <p>You can put any content you want in here.</p>
      </PopUp></div>
    </div>
  );
};

export default ListingAnnouncements;
