import Image from "next/image";
import Link from "next/link";

type ButtonProps={
    type: 'button'|'submit';
    title : string;
    icon?: string;
    variant?: string;
    link: string;
    full?:boolean
}


const Button = ( {type ,title , icon ,variant,link,full} :ButtonProps) => {
  return (
    <button  className={`flexCenter h-12 gap-2 rounded-full border ${variant} ${full && 'w-full'}`} type={type}>
        {icon && <Image src={icon} alt={title} width={22} height={22} />}
        <Link href={link}>
        <label className="regular-18  cursor-pointer whitespace-nowrap">{title}</label>
        </Link>
    </button>
  )
}

export default Button