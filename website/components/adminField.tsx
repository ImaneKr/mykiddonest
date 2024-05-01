import React, { useState } from 'react';
import { MdVisibility, MdVisibilityOff } from 'react-icons/md';

type Args = {
   label: string;
   initialValue?: string;
   initialDate?: Date;
   isDate?: boolean;
   isPassword?: boolean;
};

const AdminField = ({ label, initialValue, isDate = false, isPassword = false, initialDate }: Args) => {
    // Ensure initial date is in ISO string format
    const initialDateValue = initialDate instanceof Date ? initialDate.toISOString().split('T')[0] : '';

    const [value, setValue] = useState(initialValue !== undefined ? initialValue : (isDate ? initialDateValue : ''));
    const [showPassword, setShowPassword] = useState(false);

    const togglePasswordVisibility = () => {
        setShowPassword(!showPassword);
    };

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className='flex flex-col pt-3'>
            <label className='regular-14 pl-2 pb-1'>{label}</label>
            <div className='relative'>
                <input 
                    type={isPassword && !showPassword ? 'password' : isDate ? 'date' : 'text'} 
                    value={value} 
                    onChange={handleChange}
                    className='border border-gray-15 shadow-sm p-0.5 rounded-sm w-full regular-14 px-4'
                />
                {isPassword && (
                    <button 
                        onClick={togglePasswordVisibility} 
                        className='relative bottom-6 left-[90%] pl- z-20 pt-0.5'
                    >
                        {showPassword ? <MdVisibility /> : <MdVisibilityOff />}
                    </button>
                )}
            </div>
        </div>
    );
};

export default AdminField;
