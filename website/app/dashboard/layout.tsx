'use client';
import Navbar from "@/components/ui/Dnavbar"
import Sidebar from "@/components/ui/sidebar"
import Breadcrumb from "@/components/ui/breadcrumb";
import { AiOutlineRight } from "react-icons/ai";
import Link from "next/link";
export default function DashboardLayout({
    children, // will be a page or nested layout
  }: {
    children: React.ReactNode
  }) {
    return (
      <section className="flex flex-row">
    
        <div >
          <Sidebar/>
        </div>
        <div className="bg-gray-20 w-full h-screen pr-1 overflow-y-scroll">
          <Navbar/>
          <Breadcrumb 
          homeElement={<Link href='/dashboard'></Link>}
          separator={ <AiOutlineRight className="mt-1"/>}
          containerClasses="flex gap-2  ml-1 regluar-18 rounded-md bg-white w-[100%] p-2"
          listClasses="your-breadcrumb-item"
          activeClasses="your-active-breadcrumb-item"
          capitalizeLinks={true}
          />
          {children}
        </div>
        
      </section>
    )
  }