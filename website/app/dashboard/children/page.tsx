"use client";
import React from 'react'
import { useState } from 'react'
import { GoTriangleUp } from "react-icons/go";
import KidList from '@/components/ui/NChildrenList'
const Page = () => {
   const userNum = ['83'] // later this will be from the data base
   const MaleNum =['20']
   const FemaleNum = ['63']

  return (
    <div className='flex flex-col w-full h-full  items-center'>
      <div className='bg-white mt-1 ml-1 p-3 h-full flex flex-col w-[99%]  rounded-md lg:gap-0 gap-5'>
       <h1 className='inline-block bold-32 '>Children Profiles management</h1>
       <section className='px-5 pt-3 flex  lg:flex-row flex-col lg:justify-between items-center mb-3 lg:gap-0 gap-5'>
            <div className='lg:w-[25%] w-[50%] h-auto p-3 lg:p-[1.5%] rounded-lg bg-blue-40'>
              <p className='font-medium'> Totale Users</p>
              <div className='flex flex-col '>
              <p className='bold-32 text-gray-600 mt-2'>{userNum}</p>
              <p className='   text-gray-600 text-sm'>Currently enrolled</p>
              </div>
            </div>
            <div className='lg:w-[25%] w-[50%]  h-auto p-[1.5%] rounded-lg bg-orange-90'>
              <p className='font-medium '> Male kids</p>
              <p className=' bold-32 text-gray-600 mt-2'>{MaleNum}</p>
              <p className=' flex regular-14'> <GoTriangleUp className='size-4 mt-1'/> 44.58%</p>
            </div>
            <div className='lg:w-[25%] w-[50%]  h-auto p-[1.5%] rounded-lg bg-blue-40'>
              <p className='font-medium'> Female kids</p>
              <p className=' bold-32 text-gray-600 mt-2'>{FemaleNum}</p>
              <p className=' flex regular-14'> <GoTriangleUp className='size-4 mt-1'/> 55.43%</p>
            </div>
       </section>
       <div className='w-[98%]  flex justify-between items-center mb-3 mt-2  '>
            <h2 className='inline-block bold-24'>
              List Of Children
            </h2>
       </div>
       <div>
        <KidList/>
       </div>
      </div>
      </div>

  )
}

export default Page