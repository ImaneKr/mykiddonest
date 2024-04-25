import React, { useState } from 'react';

const LanguageSelect = () => {
  const [selectedLanguage, setSelectedLanguage] = useState('');

  const handleLanguageChange = (e) => {
    setSelectedLanguage(e.target.value);
  };

  return (
    <div className="flex items-center space-x-2">
      <select
        id="language-select"
        value={selectedLanguage}
        onChange={handleLanguageChange}
        className="px-1 py-1 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm shadow"
      >
        <option value="en" >English</option>
        <option value="fr">French</option>
       
      </select>
    </div>
  );
};

export default LanguageSelect;
