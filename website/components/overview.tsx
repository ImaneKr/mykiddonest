import Image from 'next/image'
import React from 'react'
import Card from './Card'

const overview = () => {
  return (
    <section className=' padding-container flex flex-col 
    gap-10  xl:flex-col items-center '>
      <div>
        <p className='bold-24 lg:bold-32 '> Discover our software platform</p>
        <div className=' bg-gradient-to-br w-lvw  p-12 px-16 flex flex-col xl:flex-row'> 
           <p className='bold-32 text-brown-20 leading-10 tracking-wide pt-12 pr-52'>
           Take parenting and nursery <br /> management to new heights <br/>with MyKiddoNest
           </p>
           <div className='relative  w-[400px] h-[250px] hpx-24 pb-0'>
                <Image src="/stt.png" alt='admin'  width={350} height={0} className='relative  '/>
                <Image src="/app.png" alt='mobile app' width={100} height={0} className='relative right left-[270px] top-[-160px]'/>
                <Image src="/frame6.png" alt='rocket' width={120}  height={0} className='relative right-10 bottom-[17rem]'/>
           </div>
        </div>
        <p className='bold-24 lg:bold-32'> Why <span className='text-green-30'> MyKiddoNest </span> is your first choice</p>
        <div className='  flex md:flex-row items-center flex-col gap-5'>
                <Card title='Real-Time Update' 
                description='Experience Seamless Connectivity with Our Intuitive Platform'
                icon='/time.png'
                color='border-yellow-40'
                backgound='bg-yellow-40'
                />

                <Card title='Effortless Data Sharing' 
                description='Immerse Yourself in the Smooth and Intuitive Flow of Information'
                icon='/share.png'
                color='border-blue-90'
                backgound='bg-blue-90'
                />
                <Card title='Friendly Supportive community' 
                description='Join us in a welcoming community
                that values collaboration'
                icon='/family_1.png'
                color='border-green-30'
                backgound='bg-green-30'
                />
        </div>
        </div>
    </section>
  )
}

export default overview