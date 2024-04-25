import Image from "next/image";
import Intro from "@/components/intro";
import Features from "@/components/features";
import Navbar from "@/components/Navbar";
import GetApp from "@/components/getApp";
import Footer from "@/components/Footer";
import Pricing from "@/components/pricing";
import About_us from "@/components/about_us";
export default function Home() {
  return (
    <main>
      <Navbar/>
      <Intro />
      <Features />
      <Pricing/>
      <GetApp/>
      <About_us/>
      <Footer/>
    </main>
  );
}
