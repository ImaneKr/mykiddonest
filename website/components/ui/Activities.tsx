import Link from 'next/link'
import React from 'react'

const Activities = () => {
  return (
    <div className=' border-2 inline-block p-3  rounded-lg '>
         <p className='medium-18 mb-2'> Activities</p>
         <div className='w-auto  px-3 py-2 gap-8 flex rounded-lg bg-orange-90 mb-2'>
            <p>
                Create Staff account
            </p>
            <button className='bg-yellow-40 text-white inline-block p-1 px-2 ml-3 rounded-lg '> 
                 <Link href='/dashboard/teams'>+ New Account</Link>
            </button>
         </div>
         <div className='w-auto h-auto px-3 py-2 flex rounded-lg bg-orange-90 mb-2'>
            <p>
                Create Guardian account
            </p>
            <button className='bg-yellow-40 text-white inline-block p-1 px-2 ml-3 rounded-lg '> 
                 <Link href='/dashboard/Guardians '>+ New Account</Link>
            </button>
         </div>
         <div className='w-auto h-auto px-3 py-2 flex gap-12 rounded-lg bg-orange-90 mb-2'>
            <p>
                Modify Child profile
            </p>
            <button className='bg-yellow-40 text-white inline-block p-1 px-2 ml-3 rounded-lg '> 
                 <Link href='/dashboard/children'>+ edit Profile</Link>
            </button>
         </div>
         <div className='w-auto h-auto px-3 py-2 flex justify-between rounded-lg gap-4 bg-orange-90 mb-2'>
            <p>
                Publish Content
            </p>
            <button className='bg-yellow-40 text-white inline-block p-1 px-2 ml-3 rounded-lg '> 
                 <Link href='/dashboard/content'>+ New Account</Link>
            </button>
         </div>
        
   </div>
  )
}

export default Activities