// components/ContentSelect.js
import React, { useState } from 'react';

const ContentSelect = ({ onSelectChange }) => {
  const [selectedContent, setSelectedContent] = useState('event');

  const handleContentChange = (e) => {
    setSelectedContent(e.target.value);
    onSelectChange(e.target.value);
  };

  return (
    <div className="flex items-center space-x-2">
      <select
        id="language-select"
        value={selectedContent}
        onChange={handleContentChange}
        className="px-1 py-1 border  border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm shadow"
      >
        <option value="event"  className='regular-12  group focus:bg-blue-90 '>Event</option>
        <option value="announcement" className='regular-12  group focus:bg-blue-90'>Announcement</option>
      </select>
    </div>
  );
};

export default ContentSelect;
