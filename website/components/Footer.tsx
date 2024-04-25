import { FOOTER_CONTACT_INFO, FOOTER_LINKS, SOCIALS } from '@/constants'
import Image from 'next/image';
import Link from 'next/link';
import React from 'react'

const Footer = () => {
  const current_year = new Date().getFullYear;
  return (
    <footer className='flexCenter '>
        <div className='flex flex-col justify-start  pt-8 '>
            <div className='flex flex-row justify-start items-end '>
               <div className='w-1/6 justify-start lg:pl-20 pl-7'><img src='/playgroundL.png' className='w-20 h-24'/></div>
               <div className='w-1/3 justify-start'><img src='/flowers.png' className='w-12 h-10'/></div>
               <div className='w-1/3 justify-start'><img src='/kiddaPlaying.png' className='w-16 h-16'/></div>
               <div className='w-1/12 justify-start'><img src='/kidPlaying.png' className='w-12 h-12'/></div>
               <div className='w-auto lg:pr-12 pr-7'><img src='/playgroundR.png' className='w-20 h-24'/></div>
            </div>
            <div className='padding-container bg-yellow-10 max-container flex w-screen border-2 pt-0 flex-col gap-14 border-yellow-40 bg-orange-15'>
             <div className='flex flex-col items-start justify-center gap-[9%] md:flex-row'>
                <Link href='/' className='mb-24'>
                  <Image src='/logo.png' alt='logo' width={200} height={29}/>
                </Link>
                <div className='flex flex-wrap gap-10 sm:justify-between md:flex-1'>
                {FOOTER_LINKS.map((columns) => (
              // eslint-disable-next-line react/jsx-key
              <FooterColumn title={columns.title}>
                <ul className="regular-14 flex flex-col gap-4 text-gray-30">
                  {columns.links.map((link) => (
                    <Link href="/" key={link}>
                      {link}
                    </Link>
                  ))}
                </ul>
              </FooterColumn>
            ))}
            </div>
               <div className="flex flex-col gap-5">
              <FooterColumn title={FOOTER_CONTACT_INFO.title}>
                {FOOTER_CONTACT_INFO.links.map((link) => (
                  <Link
                    href="/"
                    key={link.label}
                    className="flex gap-4 md:flex-col lg:flex-row"
                  >
                    <p className="whitespace-nowrap">
                      {link.label}:
                    </p>
                    <p className="medium-14 whitespace-nowrap text-blue-70">
                      {link.value}
                    </p>
                  </Link>
                ))}
              </FooterColumn>
            </div>
            <div className="flex flex-col gap-5">
              <FooterColumn title={SOCIALS.title}>
                <ul className="regular-14 flex gap-4 text-gray-30">
                  {SOCIALS.links.map((link) => (
                    <Link href="/" key={link}>
                      <Image src={link} alt="logo" width={24} height={24} />
                    </Link>
                  ))}
                </ul>
              </FooterColumn>
             </div>  
             </div>
        </div>
        </div>
        
    </footer>
  )
}
type FooterColumnProps = {
  title: string;
  children: React.ReactNode;
}

const FooterColumn = ({ title, children }: FooterColumnProps) => {
  return (
    <div className="flex flex-col gap-5">
      <h4 className="bold-18 whitespace-nowrap">{title}</h4>
      {children}
    </div>
  )
}
export default Footer