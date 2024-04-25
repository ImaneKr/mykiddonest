// pages/page.js
'use client';
import React, { useState } from 'react';
import CategorySelect from '@/components/ui/categorySelect';
import MyTimeTable from '@/components/ui/MyTimeTable';
import {MdOutlineEditCalendar} from 'react-icons/md';

const Page = () => {
  const [selectedCategory, setSelectedCategory] = useState('A');
  const [editButtonState, setEditButtonState] = useState(false);

  const handleSelectChange = (value:any) => {
    setSelectedCategory(value);
  };

  const handleButtonPress = () => {
    setEditButtonState(!editButtonState);
  };

  return (
    <div className="flex flex-col h-full lg:pl-10 lg:pr-10 pl-5 pr-5 pb-4 pt-2 gap-2 bg-white rounded-md mt-1 ml-1 mr-2">
      <div className="flex flex-row justify-between pt-3">
       <h1 className='inline-block bold-32 '> Time Tables</h1>
      <div className='w-auto flex flew-row gap-5  '><button onClick={handleButtonPress} disabled={editButtonState}><div className='w-7'><MdOutlineEditCalendar className={`w-full h-full ${editButtonState? 'opacity-20':''}`} /></div></button><CategorySelect onSelectChange={handleSelectChange} /></div>
      </div>
      {selectedCategory === 'A' ? (
        <div className='flex  p-2 pt-4'><MyTimeTable category={'A'} isEditPressed={editButtonState}/></div>
      ) : selectedCategory === 'B' ? (
      <div className='flex p-2'><MyTimeTable category={'B'} isEditPressed={editButtonState}/></div>
      ) : null}
      <div className={`flex  w-full pt-4 pr-2 justify-end items-end font-sans font-medium text-white ${!editButtonState?'opacity-20':''}`}><button className='flex w-16 h-10 p-2 rounded-md bg-blue-500 justify-center' onClick={handleButtonPress} disabled={!editButtonState}>Save</button></div>
    </div>
  );
};

export default Page;
