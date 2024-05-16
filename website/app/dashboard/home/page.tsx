import StatCards from '@/components/ui/StatCards';
import { PiUserListLight } from "react-icons/pi";
import { BsCheckLg } from "react-icons/bs";
import React from 'react'
import Activities from '@/components/ui/Activities';

const page = () => {
  const userName = ['Sarah'];
  return (
    <div className='flex flex-col w-full justify-center items-center'>
       <div className='bg-white mt-1 ml-1 p-3 flex flex-col w-[99%] rounded-md'>
       <h1 className=' bold-24 w-auto '>Good Afternoon, <span className=' text-blue-90'>{userName}!</span> </h1>
       <div className='flex lg:flex-row w-full flex-col ml-5 lg:pr-7   gap-12 mt-2'>
       <StatCards 
       title='Enrolled children'
       statnum='83'
       background='bg-blue-40'
       btbg='bg-blue-90'
       icon={<PiUserListLight
            className='size-7' 
            color='#ffffff'
         />}
         link='/dashboard/children'
       txtcol='text-blue-90'
       boderColor='border-blue-50' />

       <StatCards 
       title='Staff members'
       statnum='12'
       background='bg-orange-90'
       btbg='bg-yellow-40'
       icon={<PiUserListLight
            className='size-7' 
            color='#ffffff'
         />}
         link='/dashboard/teams'
       txtcol='text-yellow-40'
       boderColor='border-yellow-40' />
       <StatCards 
       title='All Payments'
       statnum='21'
       background='bg-blue-40'
       btbg='bg-green-40'
       icon={<BsCheckLg
            className='size-7' 
            color='#ffffff'
         />}
         link='/dashboard/Payment'
       txtcol='text-green-40'
       boderColor='border-green-40' />
       </div>
      <p className=' bold-24 w-auto pt-2'>Insights</p>
       <div className='justify-end flex pt-6'>
          <Activities />
       </div>
    </div>
    </div>
  )
}

export default page