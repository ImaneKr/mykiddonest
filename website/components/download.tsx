import Image from 'next/image';
import React from 'react'

const download = () => {
  return (
    <section className='max-container pt-5 px-10'>
         <div className='flex md:flex-row items-center flex-col border-2 rounded-lg'>
            <div className=' flex flex-col items-center justify-center w-[360px] h-[300px] px-5 ml-6 '>
                <p className='regular-24'> QR code</p>
                <Image src="/qrCode.png" alt=' Qr code' width={160} height={100}/>
                <p className='regular-16'> Use your Phone carema to scan this code</p>
            </div>
            <div className='flex-1 flex-col items-center justify-center ml-40'>
                <h2 className='bold-32 text-blue-70'> Stay Connected with Your <br/>
                Child's Preschool Journey!!<Image src="/rocket.jpg" alt='rocket' width={24} height={24}/> </h2>
                <p className='regular-18 mt-3'>
                Do Not miss the chance to get the latest updates <br/> And cherish every moment with the MyKiddoNest App
                </p>
            </div>
         </div>
    </section>
  )
}

export default download