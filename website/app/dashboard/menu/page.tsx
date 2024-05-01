'use client';
import React, { useState } from 'react';
import { Button } from '@mui/material';
import { BiEdit } from "react-icons/bi"; 
//import ListingMeals from '@/components/listingMeals';

const Page = () => {
  const [allowChanges, setAllowChanges] = useState(false);

  const handleAllowingChanges = (value:any) => {
    setAllowChanges(value);
  };

  return (
    <div className='flex flex-col w-full  justify-center items-center'>
    <div className='bg-white mt-1 h-full  p-3 flex flex-col w-[99%] rounded-md'>
      <div className="flex flex-row justify-between items-center">
       <h1 className='inline-block bold-32 pb-3'>Lunch Menu</h1>
       <Button className={`flex w-10 h-10 text-black`}><BiEdit className='h-full w-full'></BiEdit></Button>
      </div>
    </div>
    </div>

  );
};

export default Page;
