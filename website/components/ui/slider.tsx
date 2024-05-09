import React, { useState } from 'react';
import { Slider } from '@mui/material';

interface SliderProps {
  initialValue: number;
  color:string;
}

const SliderComponent: React.FC<SliderProps> = ({ initialValue , color }) => {
  const [value, setValue] = useState(initialValue);

  const handleChange = (event: Event, newValue: number | number[]) => {
    setValue(newValue as number);
  };

  return (
    <div className='flex w-2/3 pr-5'>
      <Slider
        value={value}
        onChange={handleChange}
        min={0}
        max={100}
        aria-labelledby="continuous-slider"
        className={color}
      />
    </div>
  );
};

export default SliderComponent;