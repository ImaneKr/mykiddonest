const { ENUM } = require("sequelize");

var DataTypes = require("sequelize").DataTypes;

function initModels(sequelize) {

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
  });
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
    }
  });

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
  });

  const EventList = sequelize.define('EventList', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    accept: {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    },
    decline: {
      type: DataTypes.BOOLEAN,
      defaultValue: false
    }
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
  });
  return {
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
    WebSetting
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
