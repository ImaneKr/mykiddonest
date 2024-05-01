/*import React, { useState, useEffect } from 'react';
import MealsMenu, { DayAndItsMeals, Meal } from './dayAndItsMeals';
import Image from 'next/image';
import ImagePicker from '@/components/ui/imagePicker';
import MealField from './mealField';

const ListingMeals: React.FC = () => {
const colors:String[]
  return (
    <div className='flex flex-row gap-5 rounded-md border-2 border-green-50 p-2'>
      <div className={`flex flex-col gap-3 p-2`}>
        {MealsMenu.map((day: DayAndItsMeals, index: number) => (
          <div key={index}  className='border border-red-90'>
              <div className="flex p-1 m-1 my-2 w-24 justify-center items-center  regular-16">{day.day}</div>
            <div>
            <div className='flex lg:flex-row flex-col gap-3'>
            {day.meals.map((meal: Meal, mealIndex: number) => (
              <div key={mealIndex} >
                <div className='flex w-auto h-auto rounded-md border border-gray-300 p-1'> <img src={meal.image} alt={meal.name} className='h-20 w-20'/> </div>
                <MealField initialValue={meal.name}/>
              </div>
            ))}
            </div>
            </div>
          </div>
        ))}
      </div>
    </div>

  );
};

export default ListingMeals;
*/