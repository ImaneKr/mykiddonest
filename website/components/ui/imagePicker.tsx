import React, { useState, useEffect, useRef } from "react";
import Image from "next/image";

type ImagePickerProps = {
  disabled: boolean;
  isProfilePic?: boolean;
  profilePic?: string;
  isGuardianPic?: boolean;
  isContentPic?: boolean;
  contentPicPath?: string;
  isMealPic?: boolean;
  mealPic?: string;
  forCreation?:boolean;
  onImageSelected: (imgPath: string) => void;
};

const ImagePicker: React.FC<ImagePickerProps> = ({
  disabled,
  isProfilePic,
  profilePic,
  isGuardianPic,
  isContentPic,
  contentPicPath = "/defaultContentPic.jpg",
  isMealPic,
  mealPic,
  forCreation,
  onImageSelected,
}: ImagePickerProps) => {
  const [image, setImage] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      let img = e.target.files[0];
      const imageUrl = URL.createObjectURL(img);
      setImage(imageUrl);
      onImageSelected(imageUrl);
    }
  };

  const handleButtonClick = () => {
    if (fileInputRef.current) {
      fileInputRef.current.click();
    }
  };

  useEffect(() => {
    return () => {
      if (image) {
        URL.revokeObjectURL(image);
      }
    };
  }, [image]);

  return (
    <div>
      <input
        type="file"
        accept="image/*"
        style={{ display: "none" }}
        ref={fileInputRef}
        onChange={handleImageChange}
      />
      <button
        className="flex flex-col justify-center items-center w-full p-6"
        onClick={handleButtonClick}
        disabled={disabled}
      >
        {!image && isContentPic && contentPicPath && (
          <Image
            src={contentPicPath}
            alt="announcement"
            width={150}
            height={150}
            className="rounded-md border border-dashed border-blue-600 p-1"
          />
        )}
        {image && !isMealPic && (
          <Image
            src={image}
            alt={isProfilePic ? "Profile" : "Selected"}
            width={110}
            height={110}
            className={
              isProfilePic || isGuardianPic
                ? "rounded-full border-2 border-gray-300 p-1"
                : "rounded-md border-2 border-gray-300 p-1"
            }
          />
        )}
        {!image && isProfilePic && profilePic && (
          <div
            className={`flex justify-center items-center rounded-full p-1 ${
              disabled ? "border-2 border-gray-300" : "border border-dashed border-blue-700"
            }`}
          >
            <Image src={profilePic} height={90} width={90} alt="profile pic" />
          </div>
        )}
        {!image && isMealPic && mealPic && (
          <div
            className={`flex ${forCreation?'w-40 h-40':'w-28 h-28'} rounded-md border ${
              disabled ? "border-gray-300" : "border-dashed border-blue-600"
            } p-1`}
          >
            <img src={mealPic} className="h-full w-full" alt="meal pic" />
          </div>
        )}
        {image && isMealPic && mealPic && (
          <div
            className={`flex ${forCreation?'w-40 h-40':'w-28 h-28'} rounded-md border ${
              disabled ? "border-gray-300" : "border-dashed border-blue-600"
            } p-1`}
          >
            <img src={image} className="h-full w-full" alt="meal pic" />
          </div>
        )}
        {!image && isProfilePic && !profilePic && (
          <div className="flex justify-center items-center rounded-full p-1 border border-dashed border-blue-700">
            <Image src="/dfProfile.jpg" height={90} width={90} alt="profile pic" className="rounded-full" />
          </div>
        )}
        {!image && isGuardianPic && (
          <div className="flex flex-row w-[70%] h-28 items-center justify-center gap-10">
            <div className="flex flex-col justify-center items-center">
              <p className="font-sans text-base font-semibold">Drop your image here:</p>
              <p className="text-blue-600 regular-16">&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; </p>
            </div>
            <div className="flex flex-col justify-center items-center h-50 w-50 px-7 py-2 border-2 border-dashed border-blue-600 rounded-full">
              <Image src="/dropImg.png" height={60} width={60} alt="upload pic" />
              <p className="regular-14 text-gray-500">
                supports:
                <br />
                jpg, png
              </p>
            </div>
          </div>
        )}
        {!image && !isProfilePic && !isGuardianPic && !isContentPic && !isMealPic && (
          <div>
            <div className="flex w-full justify-center items-center">
              <Image src="/dropImg.png" height={60} width={60} alt="upload pic" />
            </div>
            <p className="font-sans text-base font-semibold">Drop your image here</p>
            <p className="regular-14 text-gray-500">supports: jpg, png</p>
          </div>
        )}
      </button>
    </div>
  );
};

export default ImagePicker;
