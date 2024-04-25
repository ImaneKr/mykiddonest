// components/NotificationContainer.tsx

import React, { useState } from 'react';
import { FaRegBell } from 'react-icons/fa';
import Image from 'next/image';

const NotificationContainer = () => {
    const [showNotifications, setShowNotifications] = useState(false);

    const toggleNotifications = () => {
        setShowNotifications(!showNotifications);
    };

    return (
        <div className="relative w-auto">
            <button
                onClick={toggleNotifications}
                className="p-2 rounded-full"
            >
           <FaRegBell  className='size-6' color='#000000'/>
            </button>

            {showNotifications && (
                <div className="absolute top-10 right-0 p-4 bg-white shadow-md rounded-md">
                    {/* Display your notifications here */}
                    <p>New message received!</p>
                </div>
            )}
        </div>
    );
};

export default NotificationContainer;
