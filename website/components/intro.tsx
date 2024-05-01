import Image from 'next/image'
import React from 'react'
import Button from './Button'

const intro = () => {
  return (
    <section className='max-container   flex flex-col 
    gap-10 py-10  lg:flex-row items-center justify-center'>
      <div className='  pl-12 w-[90%]'>
        <h1 className='bold-40 lg:bold-40 text-green-50'>
        A software platform to make  your Childs World, at Your Fingertips!
        </h1>
        <p className='regular-20 mt-5 xl:max-w-[600px]'>
        Unlock the potential of seamless parent-nursery collaboration
        with MyKiddoNest. Stay effortlessly connected, receive instant
       updates, and manage tasks efficiently. Elevate your childs early learning experience today!
        </p>
        <div className='my-11 flex flex-wrap gap-5'>
           <div className='flex items-center gap-2'>
            {Array(5).fill(1).map((_, index) => (
                <Image src='/icons/rating-star.svg'
                key={index}
                alt='star'
                width={24}
                height={24}
                 />
            ))}
           </div> 
              <p className='bold-16 lg:bold-20 text-blue-70'> 
              1000+ 
              <span className='regular-16 lg:regular-20 ml-1'> Excellent Reviews</span>
              </p>
        </div>
        <div className='flex w-full gap-3 sm:flex-row'>
          <Button type='button' title='Download App' variant='btn_yellow' link='#'/>
        </div>
      </div>
      <div className='hidden lg:flex h-[350px] mr-12'>
           <Image src='/cute.png' alt='' width={500 } height={350}/>
      </div>
    </section>
  )
}

export default intro