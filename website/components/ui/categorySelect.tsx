import React, { useState } from 'react';

interface CategorySelectProps {
  onSelectChange: (selectedCategory: string) => void;
}

const CategorySelect: React.FC<CategorySelectProps> = ({ onSelectChange }) => {
  const [selectedCategory, setSelectedCategory] = useState('event');

  const handleCategoryChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const value = e.target.value;
    setSelectedCategory(value);
    onSelectChange(value);
  };

  return (
    <div className="flex items-center space-x-2">
      <select
        value={selectedCategory}
        onChange={handleCategoryChange}
        className="px-1 py-1 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 text-sm shadow"
      >
        <option value="A" className='regular-12 group focus:bg-blue-90'>A</option>
        <option value="B" className='regular-12 group focus:bg-blue-90'>B</option>
      </select>
    </div>
  );
};

export default CategorySelect;
