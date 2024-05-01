import React, { useState } from 'react';
import { isDate } from 'util/types';

type Args = {
   label: string;
   initialValue?: string;
   initialDate?: Date ;
   isDate?:boolean;
   isEvent?:boolean;
};

const ContentField = ({ label, initialValue, initialDate, isDate, isEvent }: Args) => {
    const [value, setValue] = useState(isDate && initialDate ? initialDate.toISOString().split('T')[0] : initialValue || '');

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
    };

    return (
        <div className={`flex flex-col ${isEvent ? 'lg:w-80 w-[96%]' : 'lg:w-96 w-[96%]'} `}>
            <label className='pl-1.5 regular-16'>{label}</label>
            <input 
                type={isDate ? 'date' : 'text'}
                value={value} 
                onChange={handleChange}
                className='border border-gray-300 rounded-md px-4 py-2 h-auto regular-14 group focus:outline-none focus:border-blue-600'
            />
        </div>
    );
};


export default ContentField;
