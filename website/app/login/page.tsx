import Image from 'next/image'
import Link from 'next/link'
import React from 'react'
import {BsPerson} from 'react-icons/bs'
import {HiOutlineLockClosed} from 'react-icons/hi'
import {Button} from '@mui/material'

const page = () => {
  return (
    <div className='bg-gray-10  p-[10%] lg:p-[25%] lg:pt-32 h-screen items-center overflow-y-scroll'>
        <div className='border-2 relative lg:w-[90%] h-96  bg-white flex flex-1 flex-row rounded-xl '>
                <div className=' hidden lg:flex w-2/5 rounded-lg'>
                <Image src='/login.jpg' alt='school pic' width={380} height={500} className='rounded-l-lg' />
                </div>
              <div className='flex  flexCenter  flex-col flex-1  lg:w-3/5'>
                <p className='w-full font-mono regular-24  flexCenter pb-6'>
                  Log in to continue
                </p>
                <form className='flex flex-col items-center justify-center gap-4 relative'>
                <input name='username' placeholder='Enter Your Username' className='border-2 p-3 pl-8 rounded-2xl group focus:outline-none focus:border-orange-300' />
                <BsPerson  className='absolute  left-1 top-1 translate-x-1.5 translate-y-3 w-auto h-auto' style={{color:'#BBBBBB'}}/>             
                <input name='pasword' placeholder='Enter Your Password' className='border-2 p-3 pl-8 rounded-2xl group focus:outline-none focus:border-orange-300'/>
                <HiOutlineLockClosed  className='absolute left-1 bottom-1  translate-x-1.5 -translate-y-3 w-auto h-auto' style={{color:'#BBBBBB'}}/>         
                </form>
                <div className='flex flex-row   justify-end  w-full lg:pr-10 pb-5 pr-24'><Button  className='bg-white group focus:bg-white text-black regular-12 normal-case'>Forget password?</Button></div>
                <Button  className='text-white regular-16 normal-case rounded-2xl bg-orange-70 px-6 group focus:bg-orange-70 hover:bg-orange-70'><Link href='/dashboard/home'>Log in </Link></Button>
              </div>
        </div>
    </div>
  )
}

export default page 