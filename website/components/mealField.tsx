import React, { useState } from 'react';
import { MdVisibility, MdVisibilityOff } from 'react-icons/md';

type Args = {
   initialValue: string;
   disabled:boolean;
   forCreation?:boolean;
};

const MealField = ({  initialValue , disabled , forCreation}: Args) => {
    const [value, setValue] = useState(initialValue);


    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className={`flex lg:flex-row lg:items-center flex-col justify-between w-full ${forCreation?'':'pl-6'}  relative`}>
            <div className='relative'>
                <input 
                    disabled={disabled}
                    type= 'text' 
                    value={value} 
                    onChange={handleChange}
                    className={`border ${disabled?'border-gray-15' : 'border-dashed border-blue-600'} z-0 shadow-sm p-0.5 rounded-sm ${forCreation?'w-48':'w-28'}  regular-14 px-4 py-1.5  group focus:outline-none`}
                />
            </div>
        </div>
    );
};

export default MealField;
