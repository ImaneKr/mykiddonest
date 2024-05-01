import React from 'react';
import { TimeTableA  , TimingA ,TimingB  , TimeTableB} from '@/models/timeTable';
import { styled } from '@mui/material';

type TimeTableProps={
  category : String ;
  isEditPressed:boolean;
};

const MyTimeTable = ({category , isEditPressed}:TimeTableProps) => {
  let currentTable;
  let currentTiming;
  if (category === 'A') {
    currentTable = TimeTableA;
    currentTiming=TimingA;
  } else if (category === 'B') {
    currentTable = TimeTableB;
    currentTiming=TimingB;
  } else {
    // Handle invalid category
    return <div>Invalid category</div>;
  }
  return (
    <div className=" flex flex-col h-auto overflow-x-scroll ">
      <div className='pl-24 flex flex-row  gap-36'>{currentTiming.map((timing,index)=>(<div key={index} className='text-black font-serif text-sm font-medium w-4 '>{timing}</div>))}</div>
      {currentTable.days.map((day, dayIndex) => (
        <div className='flex flex-row p-2 gap-3' key={dayIndex}>
          <div className='flex w-28 items-center  rounded-md bg-green-400 p-2 text-ms font-sans font-medium text-white'><p className='  items-center  justify-center flex w-28'>{day.day}</p> </div>
          {day.subjects.map((subject, subjectIndex) => (  
            <div key={subjectIndex}> 
              <div><input type='text' value={subject.name} className={`flex w-36 pt-2 pb-2 border border-gray-300 bg-gray-10 rounded-md px-2 text-gray-90 font-sans group focus:outline-none ${isEditPressed?'border-2 border-dashed border-green-400':''}`} disabled={!isEditPressed}  /></div>
            </div>
          ))}
        </div>
      ))}
    </div>
  );
};

export default MyTimeTable;
