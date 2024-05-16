
import Link from 'next/link';
import React from 'react'

type CardProps = {
    title: string;
    statnum: string;
    background :string;
    btbg: string;
    icon?: any;
    txtcol:string;
    boderColor: string
    link:string;
}

const StatCards = ({title ,statnum,icon, background ,btbg, txtcol ,link, boderColor} : CardProps) => {
  return (
    <div className={`border-2 lg:w-4/12 w-4/6 h-[150px] rounded-lg p-4   ${boderColor} ${background}`}>
        <div className='flex flex-row  justify-between items-stretch'> 
            <h2 className='bold-18  mt-1'> {title}</h2> 
            <div className={`${btbg}  inline-block p-2 h-11 rounded-lg`}>
                {icon}
            </div>
        </div>
        <p className={`bold-24  ${txtcol} mt-[-3px]`}>{statnum}</p>
        <div className='pb-4'>
        <button className={`${btbg} inline-block p-1 px-3 mt-1  rounded-xl`} >
             <Link href={link} className='text-white' > View List</Link>
        </button>
        </div>
    </div>
  )
}

export default StatCards