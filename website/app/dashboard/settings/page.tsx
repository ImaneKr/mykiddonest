'use client';
import React from 'react';
import { RiDeleteBin6Line } from 'react-icons/ri';
import AdminField from '@/components/adminField';
import ToggleComponent from '@/components/toggle';
import LanguageSelect from '@/components/languageSelect';
import { formatDate } from '@fullcalendar/core/index.js';

const Page = () => {
  return (
    <div className='flex flex-col w-full justify-center items-center'>
       <div className='bg-white mt-1 ml-1 p-3 flex flex-col w-[99%] rounded-md'>
      <p className='text-2xl font-sans font-semibold'>Settings</p>
      <p className='regular-16 text-gray-99'>Customize until it matches your workflow</p>
      <div className='bg-white p-3 h-4/5 w-full rounded-md border border-gray-15 shadow-xl'>
        <div className='flex flex-row '>
          <p className='text-2xl font-sans font-medium w-full'>My Account</p>
          <div className='flex w-44  bg-red-10 rounded-xl pt-2 pb-2 '>
            <button className='flex flex-row gap-3 justify-center items-center'>
              <RiDeleteBin6Line className='text-red-90 m-1'/>
              <label className='text-red-90 text-sm'>Delete account</label>
            </button>
          </div>
        </div>
        <div className='flex flex-row pl-14 pt-2 gap-8 w-full  items-center'>
          <img src='/person-3.png' className='w-14 rounded-full border-2' />
          <div className='justify-center flex rounded-lg bg-blue-90 w-32  pt-1 pb-1 text-white font-sans border border-gray-15 shadow-md'><button> Upload new</button></div>
          <div className='justify-center flex rounded-lg bg-white w-24  pt-1 pb-1 text-black font-sans border border-gray-15 shadow-md'><button>Delete</button></div>
        </div>
        <div className='lg:pl-10 pb-8 flex lg:flex-row flex-col  w-full gap-10  items-center '>
          <div className='flex flex-col lg:w-2/6 w-4/5 '>
            <AdminField label='First name' initialValue='Ahlam' />
            <AdminField label='Phone number' initialValue='+21356427'  />
            <AdminField label='Date of birth' initialDate={new Date(1990 , 5 , 17)} isDate={true}/>
          </div>
          <div className='flex flex-col lg:w-2/6 w-4/5 pt-5'>
            <AdminField label='Last name' initialValue='Kabbas' />
            <AdminField label='Email address' initialValue='ahlam.k@gmail.com'/>
            <AdminField label='Password' initialValue='ahlamk2024' isPassword={true}/>
          </div>
        </div>
       <div className='flex justify-center items-center'> <hr className=' flex justify-center pb-2 w-[95%] '/>  </div>
       <div className='flex flex-row w-ful pl-10 pr-10 justify-between items-center'>
         <p className='regular-24 '>Other</p>
         <div className='relative gap-4 flex flex-row pt-1.5'> <p className='regular-16'>Appearence</p><ToggleComponent/></div> 
       </div>
       <div className='flex flex-col justify-start pl-10 '>
         <p className='regular-12 text-gray-99 pb-5'>Customizing according to your prefereces</p>
         <div className='flex flex-row  gap-4'><p className='regular-14 '>Email notification</p><ToggleComponent/></div>
         <div className='flex flex-row  gap-4 pt-2'><p className='regular-14 pr-3'>Language</p><LanguageSelect/></div>
         <div className='flex flex-row  gap-4 pt-2 justify-end pr-5'>
            <div className='justify-center flex rounded-lg bg-white w-20 pt-1 pb-1   text-black text-sm font-sans border border-gray-15 shadow-md'><button>Cancel</button></div>
            <div className='justify-center flex rounded-lg bg-gray-99 w-28 pt-1 pb-1 text-white text-sm font-sans border border-gray-15 shadow-md'><button>Save changes</button></div>
         </div>
       </div>
      </div>
    </div>
    </div>
  );
};

export default Page;
