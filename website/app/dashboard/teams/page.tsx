"use client";
import StaffList from '@/components/ui/StaffList';
import CreateStaffAccount from '@/components/ui/createStaffAccount'
import React, { useState } from 'react'

const Page = () => {
const [open,setOpen] = useState(false);
  return (
    <div className='flex flex-col w-full h-full justify-center items-center'>   
    <div className='bg-white mt-1 ml-1 h-full p-3 flex flex-col w-[99%] rounded-md'>
      <h1 className='bold-32 mb-4'> Staff Account Management</h1>
      <div className='flex justify-between mb-3'>
      <h2 className='bold-24'> List of Staff</h2>
      <CreateStaffAccount open={open} setOpen={setOpen}/>
      </div>
      <StaffList/>
    </div>
    </div>

  )
}

export default Page