import React from 'react';
import eventsList from '@/models/eventsList'; // Corrected import
import { BiDotsVerticalRounded } from 'react-icons/bi';
import Image from 'next/image';

const ListingEvents = () => {
  return (
    <div className='flex flex-col pt-5 gap-2'>
      {eventsList.map((event, index) => (
        <div key={index} className='relative w-80 h-16 border border-gray-15 mt-1 rounded-md flex items-center shadow'>
          {event.imgPath ? (
            <Image src={event.imgPath} alt={`Event ${index + 1}`} height={20} width={55} className='p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          ) : (
            <img src='/defaultEvent.jpeg' alt={`Default Event Image`} height={20} width={55} className='p-0.5 m-1 rounded-md border border-gray-15 shadow' />
          )}
          <div className='flex flex-col items-start justify-center pl-3 '>
            <label>{event.title}</label>
            <label className='regular-12'>{event.date.toLocaleDateString()}</label>
          </div>
          <div className='absolute top-1 right-0 pr-1'>
            <button className='group focus:bg-gray-500 focus:text-white rounded-sm'><BiDotsVerticalRounded/></button>
          </div>
        </div>
      ))}
    </div>
  );
};

export default ListingEvents;
