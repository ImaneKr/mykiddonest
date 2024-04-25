"use client";
import Image from 'next/image'
import Link from 'next/link'
import { useRef ,useEffect} from 'react';
import { RiNotification3Fill } from 'react-icons/ri';
import NotificationContainer from './notif_container';
import { MdKeyboardArrowDown } from 'react-icons/md';

const Dnavbar = () => {


  return (
   <nav className='pl-5 lg:pl-0 ml-1  h-auto w-[99%] bg-white rounded-md mb-1'>
      <div className=' flex   flex-row justify-center  pl-5 pr-5 pt-1 pb-1'>
        <div className='flex  flex-row p-0 justify-start w-full'>
            <div className='flex flex-row  items-center justify-start'>
            <Image src='/icons/line-md--search.svg' alt='search' width={25} height={25} />
            <input name='search' type='text' value='' placeholder='Search here ....' 
            className=' block m-2 rounded-lg  pl-5 bg-gray-20 
            border-2 focus:border-sky-200 focus:outline-none' /></div>
        </div>
        <div className='flex  items-center '>
            <NotificationContainer/>
            <Link href='#'>
            <Image src='/person-3.png'alt='search' width={48} height={20} className='border-2 lg: flex rounded-full ' />  
            </Link>
        </div>
       
      </div>
   </nav>
  )
}

export default Dnavbar

