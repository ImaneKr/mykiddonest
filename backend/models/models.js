const { ENUM } = require("sequelize");
const sequelize = require('../config/db')
var DataTypes = require("sequelize").DataTypes;

const Category = sequelize.define('Category', {

  category_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  category_name: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  category_desc: {
    type: DataTypes.STRING(255)
  }
}, {
  tableName: 'Category'
},);
//Guardian model
const Guardian = sequelize.define('Guardian', {
  guardian_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  firstname: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  lastname: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  gender: {
    type: DataTypes.ENUM('female', 'male'),
    allowNull: false
  },
  username: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  guardian_pwd: {
    type: DataTypes.STRING(40),
    allowNull: false
  },
  civilState: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  phone_number: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  acc_time_creation: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  address: {
    type: DataTypes.STRING(200)
  },
  acc_pic: {
    type: DataTypes.STRING(250)
  },
  acc_active: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  },
}, {
  tableName: 'Guardian',
  timestamps: false
},);

const Kid = sequelize.define('Kid', {
  kid_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  firstname: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  lastname: {
    type: DataTypes.STRING(50)
  },
  gender: {
    type: DataTypes.ENUM('Male', 'Female'),
    allowNull: false
  },
  allergies: {
    type: DataTypes.JSON
  },
  hobbies: {
    type: DataTypes.JSON
  },
  syndroms: {
    type: DataTypes.JSON
  },
  prof_time_creation: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  prof_pic: {
    type: DataTypes.STRING(250)
  },
  authorizedpickups: {
    type: DataTypes.JSON
  },

  guardian_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Guardian',
      key: 'guardian_id'
    }
  },
  category_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Category',
      key: 'category_id'
    }
  }
}, {
  tableName: 'Kid'
});

const Staff = sequelize.define('Staff', {
  staff_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  firstname: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  lastname: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  username: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  role: {
    type: DataTypes.ENUM('admin', 'secretary', 'teacher'),
    allowNull: false
  },
  registration_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  staff_pic: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  phone_number: {
    type: DataTypes.STRING(20)
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: false,
    unique: true
  },
  salary: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  staff_pwd: {
    type: DataTypes.STRING(50),
    allowNull: false
  }
}, {
  tableName: 'Staff'
});

const Event = sequelize.define('Event', {
  event_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  event_name: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  event_desc: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  event_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'Event'
});

const EventList = sequelize.define('EventList', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  EventId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Event',
      key: 'id'
    }
  },
  KidId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Kid',
      key: 'id'
    }
  },
  accept: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  decline: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  }
}, {
  tableName: 'EventList'
});


const Announcement = sequelize.define('Announcement', {
  announcement_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  announcement_title: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  announcement_desc: {
    type: DataTypes.STRING(250),
    allowNull: false
  },
  announcement_date: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'Announcement'
});

const Payment = sequelize.define('Payment', {
  payment_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  payment_date: {
    type: DataTypes.DATE
  },
  amount: {
    type: DataTypes.STRING(10),
    allowNull: false
  },
  status: {
    type: DataTypes.ENUM('paid', 'unpaid'),
    allowNull: false
  }
}, {
  tableName: 'Payment'
});
const Timetable = sequelize.define('Timetable', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  category_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Category',
      key: 'category_id'
    }
  },
  subject_name: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  day_of_week: {
    type: DataTypes.ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    allowNull: false
  },
  start_time: {
    type: DataTypes.TIME,
    allowNull: false
  },
  end_time: {
    type: DataTypes.TIME,
    allowNull: false
  },
  duration: {
    type: DataTypes.INTEGER,
    allowNull: false // Duration in minutes
  }
}, {
  tableName: 'Timetables'
});
const Evaluation = sequelize.define('Evaluation', {
  evaluation_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  kid_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  subject_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  mark: {
    type: DataTypes.FLOAT,
    allowNull: false
  }
}, {
  tableName: 'Evaluations'
});

Evaluation.associate = (models) => {
  Evaluation.belongsTo(models.Kid, {
    foreignKey: 'kid_id',
    onDelete: 'CASCADE'
  });
  Evaluation.belongsTo(models.Subject, {
    foreignKey: 'subject_id',
    onDelete: 'CASCADE'
  });
};
const AppSetting = sequelize.define('AppSetting', {
  setting_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  theme: {
    type: DataTypes.STRING(50),
    allowNull: false
  }
}, {
  tableName: 'AppSettings'
});
const WebSetting = sequelize.define('WebSetting', {
  setting_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  theme: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  language: {
    type: ENUM('English', 'French'),
    default: 'English',
  },
  email_notf: {
    type: DataTypes.BOOLEAN,
    default: true,
  }
}, {
  tableName: 'WebSettings'
});
const Subject = sequelize.define('Subject', {
  subject_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  subject_name: {
    type: DataTypes.STRING(50),
    allowNull: false
  }
}, {
  tableName: 'Subject'
});
const LunchMenu = sequelize.define('LunchMenu', {
  menu_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  day_of_week: {
    type: DataTypes.ENUM('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday'),
    allowNull: false
  },
  meal_name: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  item1_name: {
    type: DataTypes.STRING(50)
  },
  item1_image_url: {
    type: DataTypes.STRING(255)
  },
  item2_name: {
    type: DataTypes.STRING(50)
  },
  item2_image_url: {
    type: DataTypes.STRING(255)
  },
  item3_name: {
    type: DataTypes.STRING(50)
  },
  item3_image_url: {
    type: DataTypes.STRING(255)
  },
  item4_name: {
    type: DataTypes.STRING(50)
  },
  item4_image_url: {
    type: DataTypes.STRING(255)
  }
}, {
  tableName: 'LunchMenu',
  timestamps: false
});

module.exports = {
  Guardian,
  Kid,
  Staff,
  Event,
  EventList,
  Announcement,
  Payment,
  Timetable,
  Evaluation,
  Category,
  AppSetting,
  WebSetting,
  Subject,
  LunchMenu
};


