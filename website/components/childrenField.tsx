import React, { useState } from 'react';
import { MdVisibility, MdVisibilityOff } from 'react-icons/md';

type Args = {
   label: string;
   initialValue: string;
   isDate?: boolean;
   isPassword?: boolean;
};

const ChildrenField = ({ label, initialValue, isDate = false, isPassword = false }: Args) => {
    const [value, setValue] = useState(initialValue);
    const [showPassword, setShowPassword] = useState(false);

    const togglePasswordVisibility = () => {
        setShowPassword(!showPassword);
    };

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className='flex lg:flex-row lg:items-center flex-col justify-between w-full pt-3 relative'>
            <label className='regular-14 pl-2 pb-1'>{label}</label>
            <div className='relative'>
                <input 
                    type={isPassword && !showPassword ? 'password' : isDate ? 'date' : 'text'} 
                    value={value} 
                    onChange={handleChange}
                    className={`border border-gray-15 z-0 shadow-sm p-0.5 rounded-sm w-56 regular-14 px-4 py-1.5 ${isPassword?'flex justify-end':''} group focus:outline-none focus:border-blue-600`}
                />
                {isPassword && (
                   ( 
                    <button 
                        onClick={togglePasswordVisibility} 
                        className=' relative bottom-6 left-[90%] pl- z-20 pt-0.5'
                    >
                        {showPassword ? <MdVisibility/> :<MdVisibilityOff/>}
                    </button>)
                )}
            </div>
        </div>
    );
};

export default ChildrenField;
