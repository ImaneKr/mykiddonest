"use client";
import PaymentList from '@/components/ui/PaymentList'
import React from 'react'

const page = () => {
   
  return (
    <div className='flex flex-col w-full justify-center items-center'>
       <div className='bg-white mt-1 ml-1 p-3 flex flex-col w-[99%] rounded-md'>
        <h1 className='bold-32 mb-4'>Payment</h1>
        <PaymentList/>
       </div>
    </div>

  )
}

export default page