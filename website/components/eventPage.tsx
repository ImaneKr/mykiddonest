import React, { useState, useRef, useEffect } from 'react';
import ListingEvents from './listingEvents'; 
import { addEvent, Event } from '@/models/eventsList';
import ImagePicker from './ui/imagePicker';

const EventPage = () => {
  const [isEventPressed, setIsEventPressed] = useState(false);
  const newEventRef = useRef<HTMLDivElement>(null);
  const [selectedImagePath, setSelectedImagePath] = useState<string>(''); // State to hold selected image path

  useEffect(() => {
    if (isEventPressed && window.innerWidth < 768) {
      newEventRef.current?.scrollIntoView({ behavior: 'smooth' });
    }
  }, [isEventPressed]);

  const handleEventButtonClick = () => {
    setIsEventPressed(!isEventPressed);
  };

  const handleSubmit = () => {
    const titleInput = document.getElementById("eventTitle") as HTMLInputElement;
    const dateInput = document.getElementById("eventDate") as HTMLInputElement;

    if (titleInput && dateInput && titleInput.value && dateInput.value) {
      const eventData: Event = {
        title: titleInput.value,
        date: new Date(dateInput.value),
        imgPath: selectedImagePath,
      };
      addEvent({
  title: "New Event",
  date: new Date('2024-04-08'),
});
      setIsEventPressed(false);
    } else {
      alert('Please fill in all fields.');
    }
  };

  return (
    <div className='flex lg:flex-row flex-col w-full h-full gap-10 z-0'>
      <div className='flex flex-col justify-start items-start'>
        <div className={`flex w-20 border border-gray-15 justify-center items-center mt-1 pr-1 pb-1 rounded-md ml-3 focus:outline-none ${isEventPressed ? 'shadow-none bg-white opacity-50' : 'shadow-2xl   bg-blue-600 text-white'}`}>
          <button className='w-full h-full' onClick={handleEventButtonClick} disabled={isEventPressed}>
            <label className='regular-12'>+ Event</label>
          </button>
        </div>
        <ListingEvents />
      </div>

      <div className='flex flex-col pt-10 lg:items-end items-center w-full' ref={newEventRef}>
        <div className={`flex flex-col lg:w-[80%] w-[90%] rounded-md border  shadow-xl bg-white justify-center items-start p-5 pt-3 gap-3  ${!isEventPressed ? 'border-gray-15 opacity-50' : 'border-blue-90'}`}>
          <p className='font-sans text-lg font-medium'>Create an event</p>
          <input
            id="eventTitle"
            type='text'
            className={`w-full border  rounded-md px-2 py-1 ${!isEventPressed ? 'border-gray-15' : 'border-blue-90'} group focus:border-2 focus:border-blue-90 focus:outline-none`}
            placeholder='Title'
            disabled={!isEventPressed}
          />
          <input
            id="eventDate"
            type='date'
            className={`w-full border  rounded-md px-2 py-1 placeholder-gray-15 ${!isEventPressed ? 'border-gray-15' : 'border-blue-90'} group focus:border-2 focus:border-blue-90 focus:outline-none`}
            defaultValue=''
            disabled={!isEventPressed}
          />
          <div id="newEvent" className={`flex flex-col w-full border-2 border-dashed  rounded-md  ${!isEventPressed ? 'border-gray-15 opacity-50' : 'border-blue-400 '}`}>
            <ImagePicker disabled={!isEventPressed} onImageSelected={setSelectedImagePath}/>
          </div>
          <div className='flex flex-row justify-between w-full mt-4'>
            <div className='flex border border-gray-15 rounded-md '>
              <button className={`w-full h-full p-2 pl-3 pr-3 regular-12 ${!isEventPressed ? ' bg-gray-15' : ''}`} disabled={!isEventPressed} onClick={handleEventButtonClick}>
                Cancel
              </button>
            </div>
            <div className='flex border border-gray-15 rounded-md '>
              <button className={`w-full h-full p-2 pl-4 pr-4 regular-12 bg-blue-600 rounded-md text-white ${!isEventPressed ? 'opacity-50' : ''}`} disabled={!isEventPressed} onClick={handleSubmit}>
                Submit
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default EventPage;
