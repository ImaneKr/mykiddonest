'use client';
import Image from 'next/image'
import Link from 'next/link'
import React from 'react'
import { NAV_LINKS } from '@/constants'
import Button from './Button'
import Login from '../app/login/page'

const navbar = () => {
  return (
    <nav className=' flexBetween max-container padding-container relative py-3'>
       <Link href="/">
        <Image src="/logo.png" width={150} height={50} alt='logo'/>
       </Link>
       <ul className='hidden h-full gap-12 lg:flex'>
             {NAV_LINKS.map((link)=>(
               <Link href={link.href} key={link.key} className="regular-18 text-gray-50 flex-center cursor-pointer pb-1.5 transition-all
                focus:text-orange-400 focus:outline-none hover:underline-orange-400">
                {link.label }
               </Link>
             ))}
       </ul>
       <div className='lg:flexCenter'>
        <Button
        type='button'
        title='Login'
        icon='/icons/ri--user-line.svg'
        variant='btn_yellow'
        link='/login'/>
       </div>
    </nav>
  )
}

export default navbar