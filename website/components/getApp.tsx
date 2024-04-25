import React from 'react'
import Button from './Button'
import Image from 'next/image'

const getApp = () => {
  return (
    <section className='flexCenter w-full flex-col pb-[100px]'>
          <div className='get-app'>
               <div className='z-20 flex w-full flex-1 flex-col items-center 
               justify-center gap-10'>
                <h2 className='bold-40 lg:bold-52 xl:max-w[320px]'> Get for free now!</h2>
                <p className='regular-18 lg:regular-20'> Available on IOS and android, download now!!</p>
                <div className='flex w-full flex-col gap-3 whitespace-nowrap lg:flex-row '>
    
                <Button 
                    type='button'
                    title='Play Store'
                    icon='/icons/mage--playstore.svg'
                    variant='btn_white'
                    link='#'
                    full
                    />
                <Button 
                    type='button'
                    title='App Store'
                    icon='/icons/apple-logo.svg'
                    variant='btn_transparent'
                    link='#'
                    full
                    />       
                </div>
                <p className='regular-18 lg:regular-20'> Or scan this code with your phone</p>
                <Image src='/qrCode.png' alt='' width={200} height={24} className='rounded-2xl'/>
               </div>
                <div className='flex flex-1 items-center mt-[-4rem] justify-end'>
                <Image src='/phone-mockup.png' alt='' width={574} height={800} /> 
                </div>
          </div>
    </section>
  )
}

export default getApp