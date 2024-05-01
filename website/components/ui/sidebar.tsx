import React, { useState , useEffect } from "react";
import { Disclosure } from "@headlessui/react";
import { HiDotsVertical } from "react-icons/hi";
import { RiSettings3Line } from "react-icons/ri";
import { BiDollar ,BiRestaurant } from "react-icons/bi";
import { FaUsers } from "react-icons/fa";
import { CgGirl } from "react-icons/cg";
import { AiOutlineCalendar } from "react-icons/ai";
import { RiDashboardLine } from "react-icons/ri";
import { RiParentLine } from "react-icons/ri";
import {GoSignOut} from "react-icons/go";
import Link from "next/link";
import Image from "next/image";

function Sidebar() {
  const [isOpen, setIsOpen] = useState(false);
  const [isPressed , setIsPressed]=useState(1);
  useEffect(() => {
    // Fonction toverufy the screen size
    const handleResize = () => {
      if (window.innerWidth < 768) {
        setIsOpen(false); 
      } else {
        setIsOpen(true); 
      }
    };
    // Exécuter la fonction handleResize lors du chargement initial
    handleResize();

    window.addEventListener("resize", handleResize);

    // cleanning the listener when resizing the window
    return () => window.removeEventListener("resize", handleResize);
  }, []); 
 
  return (
    <div>
      <Disclosure>
        {({ open }) => (
          <>
            <button
              className="lg:hidden fixed  z-50 right-15 top-3 items-center  justify-center rounded-md pt-2 pb-2 text-gray-700 hover:bg-gray-300 hover:text-white focus:outline-none   focus:ring-white group"
              onClick={() => setIsOpen(!isOpen)}
            >
              <HiDotsVertical
                className="block md:hidden h-6 w-6"
                aria-hidden="true"
              />
            </button>
            {isOpen && (
<div className={`flex flex-col justify-between w-60 h-screen bg-white z-20 fixed lg:static shadow-inner ${window.innerHeight < 500 ? 'overflow-y-scroll' : ''}`}>
            <div className="flex flex-col justify-start items-start">
              <div className="  justify-center items-center ">
              <Image alt="logo" width={210} height={52} src="/logo.png" className=" p-4 pb-2"/>
  
            </div>
            <div className="w-auto   pb-4">
              <button className=" w-full flex  gap-4 justify-start items-center  px-4   " onClick={()=>setIsPressed(1)}>
                <Link href='/dashboard/home' className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==1? 'bg-blue-500 text-white':''}`}> 
                   <RiDashboardLine className="text-xl text-gray-icon  " /> 
                     Dashboard
                </Link>  
              </button>
              <button className="w-full flex  gap-4 justify-start items-center  px-4 " onClick={()=>setIsPressed(2)}>
                <Link href='/dashboard/TimeTable'className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==2? 'bg-blue-500 text-white':''}`}> 
                    <AiOutlineCalendar className="text-xl text-gray-icon  " /> 
                      Time Tables
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4 " onClick={()=>setIsPressed(3)}>
                <Link href='/dashboard/Guardians' className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==3? 'bg-blue-500 text-white':''}`}> 
                  <RiParentLine className="text-xl text-gray-icon  " />              
                    Guardian&apos;s accounts
                </Link>
              </button>
              <button className="w-full flex  gap-4 justify-start items-center  px-4 " onClick={()=>setIsPressed(4)}>
                <Link href='/dashboard/children' className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==4? 'bg-blue-500 text-white':''}`}> 
                  <CgGirl className="text-xl text-gray-icon" /> 
                    Children&apos;s profiles
                </Link>
              </button>
              <button className="w-full flex  gap-4 justify-start items-center  px-4 " onClick={()=>setIsPressed(5)}>
                <Link href='/dashboard/teams'className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==5? 'bg-blue-500 text-white':''}`}> 
                  <FaUsers className="text-xl text-gray-icon  " />              
                    Staff accounts
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4 " onClick={()=>setIsPressed(6)}>
                <Link href='/dashboard/Payment' className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==6? 'bg-blue-500 text-white':''}`}> 
                  <BiDollar className="text-xl text-gray-icon  " />
                    Payement
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4   " onClick={()=>setIsPressed(7)}>
                <Link href='/dashboard/content' className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==7? 'bg-blue-500 text-white':''}`}> 
                {isPressed==7 ? <Image src='/calendarPressed.png' alt="Pressed calander" width={20} height={18} className="flex " /> : <Image src='/calendar.png' width={20} height={18} alt="calender" className="flex " /> }
                   Content
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4   " onClick={()=>setIsPressed(8)}>
                <Link href='/dashboard/menu'className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==8? 'bg-blue-500 text-white':''}`}> 
                <BiRestaurant className="text-xl text-gray-icon  " />
                   Lunch Menu
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4   " onClick={()=>setIsPressed(9)}>
                <Link href='/dashboard/settings'className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==9? 'bg-blue-500 text-white':''}`}> 
                <RiSettings3Line className="text-xl text-gray-icon  " />
                   Settings
                </Link>
              </button>
              <button className=" w-full flex  gap-4 justify-start items-center  px-4   " onClick={()=>setIsPressed(10)}>
                <Link href='/dashboard/payement'className={`flex flex-row w-full h-full gap-4  rounded-md  p-2  group  regular-14  text-gray-800  font-semibold ${isPressed==10? 'bg-blue-500 text-white':''}`}> 
                <GoSignOut className="text-xl text-gray-icon  " />
                   Log out
                </Link>
              </button>
            </div></div>
              <div className="justify-center items-center ">
                 <Image alt="logo" src="/cuteee_animals_3.png" width={70} height={52} className=" lg:w-56 pl-2 w-[95%] "/>  
              </div>
            
        </div>
            )}
          </>
        )}
      </Disclosure>
    </div>
  );
}

export default Sidebar;
