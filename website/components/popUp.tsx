// components/Popup.js
import React from 'react';

const Popup = ({ isOpen, onClose, children }) => {
  if (!isOpen) return null;

  return (
    <div className="popup-overlay">
      <div className="popup">
        <button className="close-button" onClick={onClose}>Close</button>
        {children}
      </div>
    </div>
  );
};

export default Popup;
