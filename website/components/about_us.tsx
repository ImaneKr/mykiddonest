import React from 'react'
import {GrMapLocation} from 'react-icons/gr';
import  {BiPhoneCall} from 'react-icons/bi';
import {FiMail} from 'react-icons/fi';

const about_us = () => {
  return (
    <div id='about_us' className='flex flex-row w-full gap-10   pr-5 pl-5 lg:pr-0 lg:pl-0  '>
      <div className='flex flex-col  lg:w-3/5 sm:w-full lg:pl-20 pl-5 pr-5 lg:pr-0 lg:pt-3 border-2 lg:border-none rounded-2xl pt-2 border-yellow-40 shadow-xl lg:shadow-none'>
        <div className='flex flex-row '>
          <div className='rounded-lg bg-yellow-40 h-auto w-auto pt-2 pl-5 lg:pt-3 lg:pl-7 pr-0.5 '>
             <p className='regular-32  lg:regular-40 font-mono text-white'>A</p>
           </div>
           <p className='regular-32   lg:regular-40 font-mono pt-2 lg:pt-3 font-bold' >bout us</p>
        </div>
        <p className='regular-20 pt-6 font-sans ' >    At MyKiddoNest, we believe that every child deserves a nurturing and stimulating environment to grow, learn, and explore. Our journey began 2016. Since then, we’ve been committed to providing exceptional early childhood education.</p>
        <div className='flex flex-row text-2xl font-mono font-medium pt-10'>
          <p className='text-yellow-40 font-bold pr-2'>-</p><p className='pr-2 '>Get in touch </p><p className='text-yellow-40  '>...</p>
        </div>   
        <div className='flex flex-row gap-5 font-mono'><GrMapLocation className='text-yellow-40'/><p>1008 Tlemcen, Tlemcen</p></div>
        <div className='flex flex-row gap-5 font-mono'><BiPhoneCall className='text-yellow-40'/><p>(213) 43 48 51 11</p></div>
        <div className='flex flex-row gap-5 font-mono pb-8'><FiMail className='text-yellow-40'/><p>mykiddonest@hotmail.com</p></div>
       </div>
      <div className='hidden lg:flex lg:pr-8'>
         <img src='/kid.png' alt='kid'/>
      </div>
    </div>
  )
}

export default about_us