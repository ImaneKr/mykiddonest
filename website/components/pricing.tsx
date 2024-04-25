import Image from 'next/image'
import React from 'react'
import { PRICING_OPTIONS } from '@/constants'
import { features, title } from 'process'

const pricing = () => {
  return (
    <section id='pricing' className='max-container padding-container my-10'>
        <div className='mt-10 mb-10 '>
            <div className=' flexCenter flex flex-row gap-6 relative'>
                  <div className='relative hidden lg:flex'>
                    <Image src='/icons/rating-star.svg' alt='yellow star' width={35} height={35} 
                    className=' relative rotate-[20deg] bottom-16 right-10'/>
                    <Image src='/icons/rating-star.svg' alt='yellow star' width={35} height={50} 
                    className=' relative rotate-[-20deg]  right-44'/>
                    <Image src='/icons/noto--ringed-planet.svg' alt='yellow star' width={70} height={50} 
                    className=' relative rotate-[20deg] right-10 top-5'/>
                  </div>
                 <div className='flexCenter flex flex-col gap-6 relative'>
                    <h2 className='bold-40 lg:bold-52'> Flexibale pricing options</h2>
                    <p className='regular-20 '>
                    Select the perfect pricing plan for your preferences
                    </p>
                 </div>
                  <div className='relative hidden lg:flex'>
                  <Image src='/icons/rating-star.svg' alt='yellow star' width={35} height={50} 
                    className=' relative rotate-[-30deg] bottom-14'/>
                  <Image src='/icons/rating-star.svg' alt='yellow star' width={28} height={50} 
                    className=' relative rotate-[-30deg] bottom-12 left-24'/>
                    <Image src='/icons/jellyfish.svg' alt='jelly fish' width={35} height={50} 
                    className=' relative rotate-45 left-18 '/>
                  </div>
            </div>
            <ul className='mt-10 flex flexCenter flex-col lg:flex-row gap-10 lg:gap-20'>
                {PRICING_OPTIONS.map((option)=>(
                    <OptionItem 
                    key={option.title}
                    title={option.title}
                    price={option.price}
                    background={option.variant as 'bg-green-90' | 'bg-blue-90'}
                    description={option.description}
                    features={option.features}/>
                )) }
            </ul>
        </div>

    </section>
  )
}

type OptionItem ={
    title:string;
    price:string;
    background:'bg-green-90' | 'bg-blue-90';
    description:string;
    features:string[];
}

    
const OptionItem = ({title,price,description,features,background}:OptionItem) =>{
    return(
        <li className='flex border-2 w-[350px] p-5 lg:p-8 flex-col  bg-white rounded-xl items-start drop-shadow-2xl '>
            <div className={`w-[80%] `}>
               <p className={` text-white rounded-3xl inline-block ${background} regular-18 px-5 p-1`}>{title}</p>
               </div>
            <p className='medium-22 mt-10'>{price}<span className='text-gray-500 regular-16'>/mo</span></p> 
            <hr className='bored-2 w-[100%] mb-5 h-0.5 bg-gray-10 '/>          
            <p>{description}</p>
            <div className='p-5 space-y-2 font-bold'>
                {features.map((features,index) =>(
                    <p key={index} className=''>{features}</p>
                ) 
                )}
            </div>
        </li>
    )
}

export default pricing