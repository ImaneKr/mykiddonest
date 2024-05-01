import React, { useState } from 'react';
import { MdVisibility, MdVisibilityOff } from 'react-icons/md';

type Args = {
   initialValue: string;
   
};

const MealField = ({  initialValue}: Args) => {
    const [value, setValue] = useState(initialValue);


    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className='flex lg:flex-row lg:items-center flex-col justify-between w-full pt-3 relative'>
            <div className='relative'>
                <input 
                    type= 'text' 
                    value={value} 
                    onChange={handleChange}
                    className={`border border-gray-15 z-0 shadow-sm p-0.5 rounded-sm w-32 regular-14 px-4 py-1.5  group focus:outline-none focus:border-blue-600`}
                />
            </div>
        </div>
    );
};

export default MealField;
