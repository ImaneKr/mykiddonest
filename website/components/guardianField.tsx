import React, { useState } from 'react';
import { MdVisibility, MdVisibilityOff } from 'react-icons/md';

type Args = {
   label: string;
   initialValue: string;
   isDate?: boolean;
   isPassword?: boolean;
   isEmail?: boolean;
   disabled?:boolean ;
};

const GuardianField = ({ label, initialValue, isDate = false, isPassword = false , isEmail=false , disabled=true }: Args) => {
    const [value, setValue] = useState(initialValue);
    const [showPassword, setShowPassword] = useState(false);

    const togglePasswordVisibility = () => {
        setShowPassword(!showPassword);
    };

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className='flex lg:flex-row flex-col justify-between w-full pt-3 relative'>
            <label className='regular-14 pl-2  pb-1'>{label}</label>
            <div className={`relative`}>
                <input 
                    type={isPassword && !showPassword ? 'password' : isDate ? 'date' :isEmail? 'email': 'text'} 
                    value={value} 
                    onChange={handleChange}
                    className={`border border-gray-15 z-0 shadow-sm p-0.5 rounded-sm w-56 regular-14 px-4 py-1.5 ${isPassword?'flex justify-end':''} ${!disabled?'group focus-within:outline-none border border-dashed border-blue-800':''} `}
                    disabled={disabled}
                />
                {isPassword && (
                    <button 
                        onClick={togglePasswordVisibility} 
                        className='relative -top-7 left-48 pl-2' // Adjust position here
                    >
                        {showPassword ? <MdVisibility className='bg-blue-400'/> :<MdVisibilityOff/>}
                    </button>
                )}
            </div>
        </div>
    );
};

export default GuardianField;
