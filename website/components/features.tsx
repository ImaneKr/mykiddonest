import { FEATURES } from '@/constants'
import Image from 'next/image'
import React from 'react'

const features = () => {
  return (
   <section id='features' className='flex-col flexCenter overflow-hidden p-12 ' >
        <div className='max-container padding-container relative w-full flex justify-end'>

            <div className='flex flex-1 lg:min-h-[900px]'>
                 <Image src='/home.png' alt='home page' width={330} height={24} className='feature-phone rounded-5xl shadow-2xl' /> 
             </div>
             <div className='z-20 flex w-full flex-col lg:w-[60%]'>
                <div className='relative flex gap-3'>
                <h2 className='bold-40 lg:bold-52'>Our Features</h2>
                <Image src="/icons/rocket2.svg" alt='' width={48} height={30} />  
                </div>
                
                <ul className='mt-16 grid gap-10 md:grid-cols-2 lg:mt-20 lg:gap-20'>
             {FEATURES.map((feature) => (
              <FeatureItem 
                key={feature.title}
                title={feature.title} 
                icon={feature.icon}
                description={feature.description}
                background={feature.variant}
              />
            ))}
             </ul>
             </div>
            
        </div>
   </section>
  )
}
type FeatureItem = {
  title: string;
  icon: string;
  description: string;
  background:string;
}

const FeatureItem = ({ title, icon, description,background }: FeatureItem) => {
  return (
    <li className="flex w-full flex-1 flex-col items-start">
      <div className={`rounded-full p-3 lg:p-5 ${background}`}>
        <Image src={icon} alt="map" width={28} height={28} />
      </div>
      <h2 className="bold-20 lg:bold-24 mt-5 capitalize">
        {title}
      </h2>
      <p className="regular-16 mt-5 bg-white/80 text-gray-30 lg:mt-[30px] lg:bg-none">
        {description}
      </p>
    </li>
  )
}

export default features