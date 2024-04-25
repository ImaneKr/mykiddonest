
export type Subject = {
    name: string;
  };
  
  export type DayAndItsSubjects = {
    day: string;
    subjects: Subject[];
  };
  
  export type TimeTable = {
    days: DayAndItsSubjects[];
  };
  
  // Example week data for Class A
  export const TimeTableA: TimeTable = {
    days: [
      {
        day: 'Sunday',
        subjects: [
          {  name: 'Maths' },
          { name: 'Communication' },
          { name: 'Reading' },
          { name: 'Sciences' },
          {name:''},
          {name:''},

        ],
      },
      {
        day: 'Monday',
        subjects: [
          {  name: 'Fitness' },
          { name: 'Arabic litterature' },
          { name: 'Physics' },
          { name: 'Writing' },
          { name: 'Islamic Sciences' },
          {name:''},
        ],
      },
      {
        day: 'Tuesday',
        subjects: [
          {  name: 'Fitness' },
          { name: 'Maths' },
          { name: 'History' },
          {name:''},
          {name:''},
          {name:''},
        ],
      },
      {
        day: 'Wednesday',
        subjects: [
          {  name: 'Fitness' },
          { name: 'History' },
          { name: 'Arabic' },
          { name: 'Islamic Sciences' },
          {name:''},
          {name:''},
        ],
      },
      {
        day: 'Thursday',
        subjects: [
          {  name: 'Art & activity' },
          { name: 'Maths' },
          { name: 'Writing' },
          {name:''},
          {name:''},
          {name:''},

        ],
      },
      
    ],
  };
  
  // Example week data for Class B
  export const TimeTableB: TimeTable = {
    days: [
        {
          day: 'Sunday',
          subjects: [
            {  name: 'Exercices' },
            { name: 'Alphabets' },
          {name:''},
          
          ],
        },
        {
          day: 'Monday',
          subjects: [
            {  name: 'Alphabets' },
            { name: 'Nap' },
            { name: 'Numbers' },
      

          ],
        },
        {
          day: 'Tuesday',
          subjects: [
            {  name: 'Exercices' },
            { name: 'Nap' },
            { name: 'Receiting Quraan' },

          ],
        },
        {
          day: 'Wednesday',
          subjects: [
            {  name: 'Alphabets' },
            { name: 'Nap' },
            { name: 'Songs' },
          ],
        },
        {
          day: 'Thursday',
          subjects: [
            { name: 'Exercices' },
            { name: 'Nap' },
            {  name: 'Art & activity' },
          ],
        },
        
      ],
  };
  
  export const TimingA : String[]=['08:00' ,'09:00' , '10:00' , '11:00', '13:30' , '14:30' , '15:30'];
  export const TimingB : String[]=['08:00' ,'09:00' , '10:00' , '11:00'];
