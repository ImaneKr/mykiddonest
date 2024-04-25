import { useState } from 'react';
import { BsToggleOn, BsToggleOff } from 'react-icons/bs';

export default function ToggleComponent() {
  const [isVisible, setIsVisible] = useState(false);

  const toggleVisibility = () => {
    setIsVisible(!isVisible);
  };

  return (
    
      <button onClick={toggleVisibility}>
        {isVisible ? <BsToggleOff size={30} color='#424D60' /> : <BsToggleOn size={30} color='#424D60' />}
      </button>
  );
}
