import Image from "next/image";

type CardProps={
    title: string;
    description: string;
    icon: string;
    color: 'border-yellow-40'|'border-blue-90'|'border-green-30';
    backgound : 'bg-yellow-40'|'bg-blue-90'|'bg-green-30';
}
 
const Card = ({title, description , icon , color, backgound} : CardProps) => {
  return (
    <div className={`flex items-center justify-center flex-col  border-2 ${color} rounded-lg w-[350px] h-[250px] m-5 `}>
        <div className={`border-2 ${color} ${backgound} rounded-full mb-6`}>
          <Image src={icon} alt="title" width={60} height={50}/>  
        </div>
        <p className="bold-18 lg:bold-20  ">{title}</p>
        <p className="regular-18 pl-6 m-2">{description}</p>
    </div>
  )
}

export default Card